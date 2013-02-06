# == mf_recipe
# Description: Provides a mechanism to calculate the return (in terms of gold made) via converting skill points into various items at the Mystic Toil^h^h^h^hForge.
require_relative 'mf_recipe_components'

# TODO: 
#   add "each" method for all
#   sort out the ugly TR method
#   SP and Gold costs should be derived from the components themselves and be 
#   cummulative

# Reopen the array class to add accessors for  the circumstance where we have an
# inner array (which is now true for all recipes) - this is primarily to avoid
# the clumsy arr[0][0] syntax littering the code.
class Array
    def img
        self[0].img
    end

    def price
        self[0].price
    end

    def quantity
        begin
            self[1]
        rescue
            1
        end
    end

    def name
        self[0].name
    end
end

class HighestReturn
    def initialize
        @top5 = []
    end

    def add recipe
        @top5 << recipe if @top5.size == 0

        (0..(@top5.size >= 5?4:@top5.size - 1)).each do | i |
            if recipe.profit["per_sp_value"] > (@top5[i]).profit["per_sp_value"]
                @top5.sort! { |x, y| x.profit["per_sp_value"] <=> y.profit["per_sp_value"] }
                @top5.delete_at(0) if @top5.size == 5
                @top5 << recipe
                break
            end
        end
    end

    def get i
        @top5[i]
    end

    def each &block
        #puts "***************** #{@top5.size}"
        @top5.each &block
    end
end

# == Base class
class MFRRecipe
    attr_accessor :profit, :name
    # component_name:: Required parameter which defines the name of the target combine
    # base_quantity:: The amount needed in a single combine
    # result_avg:: The average quanitity ptoduced by a combine
    protected
    def initialize component_name, base_quantity=0, result_avg=0
        @name = component_name
        @base_quantity = base_quantity
        @result_avg = result_avg

        # comps is an array of all components used to assemble the recipe
        @comps = []
    end

    # if a derived class uses the base classes forge recipe and assemble method
    # is required.
    def forge
        assemble
        # work out the price if we were to sell at the current highest price
        # note we also work out how many skill points the recipe costs
        # since some have additional skill point based components
        sale_cost = @comps.inject({:gold=>0.0 , :sp=>0}) do | sum, el | 
            if el[0].price.kind_of? SkillPointPrice
                sum[:sp] += (el[0].price.value); sum
            else
                sum[:gold] += (el[0].price.sale * el[1]);sum
            end
        end

	offer_cost = @comps.inject(0.0) { | sum, el | sum + (el[0].price.offer * el[1]) }
        calc_profits(sale_cost[:gold], offer_cost, sale_cost[:sp])

        @target_name = @result_component.name
        @target_img = @result_component.img
    end

    private
    def calc_profits sale_cost, offer_cost, sp_cost # :no_doc
        # Internal method, calculates profits and resale values and assigns them to instance level attibutes

        result_sale_value = @result_component.price.sale * @result_avg
        result_offer_value = @result_component.price.offer * @result_avg

        profit_max = ((result_sale_value * 0.85) - offer_cost).round()

        if @sp_component != nil
            profit_per_skill_point = profit_max / (( @sp_component[0].price.value * @sp_component[1]) + sp_cost)
        else
            profit_per_skill_point = 0
        end

        @cost = {  "order" => GoldPrice.to_g(offer_cost),
                    "instant" => GoldPrice.to_g(sale_cost)
        }
        @value = { "order" => GoldPrice.to_g(result_offer_value),
                    "instant" => GoldPrice.to_g(result_sale_value),
        }
        @profit = { "max" => GoldPrice.to_g(profit_max),
                    "per_sp" => GoldPrice.to_g(profit_per_skill_point),
                    "per_sp_value" => profit_per_skill_point
        }
    end

    public

    # In oreder to ensure that the latest prices are pulled from memcache it is neccessary to 
    # get a new instance of the component "array" which creates a new instance of each component
    # Note to self : Passenger and class level variables BAD!
    def self.reset_components
        @@mfrc = MFRecipeComponents.new

    end

    def self.table_header
        # Generates a table header for HTML output
            %{
                <thead><th></th><th>Target Component</th><th>Profit after Tax: <br/>Per SP (Per Combine)</th><th>Value</th>
                <th>Cost</th><th>Recipe</th></thead>
            }
    end

    def as_tr cls=""
        # Generates pricing/cost information as a table row for HTML output
        # accepts a single parameter which is the name of the class for the tr/table row
        str = %{
            <tr class="#{cls}">
            <td><img style="width:32;height:32" src='#{@target_img}'/></td>
            <td>#{@target_name}</td><td><b>#{@profit['per_sp']}</b> <br/> (#{@profit['max']})</td>
            <td><b>#{@value['instant']}</b><br/> (#{@value['order']})</td><td><b>#{@cost['order']}</b>
            <br/> (#{@cost['instant']})</td>
            <td style="vertical-align:middle;">
        }

        (0..@comps.size-1).each do |i|
                tp = ""
                if @comps[i].quantity > 1
                    tp = "Total: " + GoldPrice.to_g(@comps[i].quantity * @comps[i].price.offer)
                end
                str += %{
                    <span class="rc"><img style="width:25;height:25px" title="#{@comps[i].name}
                    #{GoldPrice.to_g(@comps[i].price.offer)} each  #{tp}" src="#{@comps[i].img}"/>&nbsp;x #{@comps[i].quantity}&nbsp;</span>
                }
        end

        if @sp_component != nil
            str += %{<span class="rc"><img style="width:25;height:25px" title="#{@sp_component[0].name}" src="#{@sp_component[0].img}"/>&nbsp;x #{@sp_component[1]}&nbsp;</span>
                }
        end
        str += %{
            </td>
            </tr>
        }
    end
end

class CraftingMaterialRecipe < MFRRecipe
        protected
        def initialize component_name, tier, base_quantity, result_avg
		super(component_name, base_quantity, result_avg)
		@target_tier = tier
		@sp_component = [Component.new("Philosopher's Stone", 0, 0.1), tier-1]
		@result_component = @@mfrc.get(@name, :position => @target_tier)
	end

        def assemble()
		@comps << [@@mfrc.get(@name, :position => @target_tier - 1), @base_quantity]
                @comps << [@@mfrc.get(@name, :position => @target_tier), 1]
		@comps << [@@mfrc.get("Dust", :position => @target_tier), 5]
        end

        public
	def as_tr cls=""
		super(cls==""? (@target_tier==6?"lvl1":"lvl2"): cls)
	end

end

# == Common Craftng Recipe
class CommonRecipe < CraftingMaterialRecipe
        def initialize component_name, tier
		super(component_name, tier, 250, tier == 6? 20 : 80 )
		@sp_component = [Component.new("Philosopher's Stone", 0, 0.1), tier - 1]
		forge
	end

        def self.each &block
            ["Ore", "Cloth", "Wood", "Leather"].each &block
        end

end

# == Fine Crafting Recipe
class FineRecipe < CraftingMaterialRecipe
        def initialize component_name, tier
		super(component_name, tier, 50, tier == 6? 6 : 16 )
		forge
	end

        def self.each &block
            ["Bone", "Fang", "Claw", "Blood", "Totem", "Scale", "Venom"].each &block
        end
end

# == Core/Lodestone
class LodestoneRecipe <  CraftingMaterialRecipe
    def initialize component_name, tier
            super(component_name, tier, 2, 1)
            @sp_component = [Component.new("Crystals", 0, 0.6), 1]
            forge
    end

    def assemble
            @comps << [@@mfrc.get(@name, :position => @target_tier - 1), @base_quantity]
            @comps << [@@mfrc.get("Bottle Of Elonian Wine"), 1]
            @comps << [@@mfrc.get("Dust", :position => @target_tier+1), 1]
    end

    def self.each &block
       ["Charged", "Molten", "Crystal", "Destroyer", "Corrupted", "Onyx"].each &block
    end

    #def as_tr
    #    super (@target_tier==5?"lvl1":"lvl2")
    #end
    def as_tr cls=""
            super(cls==""? (@target_tier==5?"lvl1":"lvl2"): cls)
    end
end

class DustRecipe <  CraftingMaterialRecipe
    def initialize component_name, tier
        super(component_name, tier, 250, 20)
        @sp_component = [Component.new("Crystals", 0, 0.6), 5]
        forge
    end

    def assemble
        super
        @comps.pop
        @comps << [[Component.new("Philosopher's Stone", 0, 0.1), @target_tier - 1], @target_tier - 1]
    end
end

# == Weapon Recipe
class MysticWeaponRecipe < MFRRecipe
    def initialize component_name
        super(component_name, 0, 1)
        @result_component = @@mfrc.get("Mystic Weapon")[@name][0]
        forge
    end

    def assemble
        @sp_component = [Component.new("Eldritch Scroll",0, 50), 1]
        @comps << [@@mfrc.get("Mystic Coin"), 30]
        @comps << [@@mfrc.get("Mystic Weapon", :subsection =>@name, :position =>2), 5]
        @comps << [@@mfrc.get("Mystic Weapon", :subsection => @name, :position => 3), 5]
    end

    def self.each &block
        @@mfrc.get("Mystic Weapon").keys.each &block
    end

    def as_tr
        super "lvl0"
    end
end

class MysticForgeRecipe < MFRRecipe
        def initialize component_name, type="Mystic Forge"
	    super(component_name, 0, 1)
	    @type = type
	    @sp_component = [Component.new("Eldritch Scroll",0, 50), 1]
            @result_component = @@mfrc.get(@type, :subsection => @name, :position => 1)
	    forge
	end

        def assemble
		(2..4).each do |i|
                    @comps << @@mfrc.get(@type, :subsection => @name, :position => i)
		end
        end

	def self.each &block
	    @@mfrc.get("Mystic Forge").keys.each &block
	end
end

class GiftRecipe < MysticForgeRecipe
	attr_accessor :price, :img, :quantity
        def initialize component_name
	    super(component_name, "Gift")

            #@name = component_name
            @img = @result_component.img
            @quantity = 1
	end

        def assemble
            super
        end

	def self.each &block
	    @@mfrc.get("Gift").keys.each &block
	end

	def calc_profits sale_cost, offer_cost, sp_cost
            #super sale_cost, offer_cost
	    @price = GoldPrice.new(0, sale_cost, offer_cost)
            @profit = { "max" => GoldPrice.to_g(0),
                    "per_sp" => GoldPrice.to_g(0)
            }
            @value = { "order" => GoldPrice.to_g(offer_cost),
                    "instant" => GoldPrice.to_g(sale_cost),
            }
            @cost = {  "order" => GoldPrice.to_g(offer_cost),
                        "instant" => GoldPrice.to_g(sale_cost)
            }
	end
end

# == Pendant Recipe
class PendantRecipe < MysticForgeRecipe
        def initialize component_name
	    super(component_name, "Pendant")
	end

        def assemble
            super
            if @name.include?("Triforge")
	        @sp_component = [Component.new("Crystals", 0, 0.6), 50]
            else
                @sp_component = nil
	        @comps << [@@mfrc.get("Dust", :position => 6), 250]
            end
        end

	def self.each &block
	    @@mfrc.get("Pendant").keys.each &block
	end
end
