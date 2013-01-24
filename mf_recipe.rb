# == mf_recipe
# Description: Provides a mechanism to calculate the return (in terms of gold made) via converting skill points into various items at the Mystic Toil^h^h^h^hForge.
require_relative 'mf_recipe_components'


# TODO: add each method for all
#       refactor - base quantity

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


# == Base class
class MFRRecipe
    # component_name:: Required parameter which defines the name of the target combine
    protected
    def initialize component_name
        @component_name = component_name
        @BASE_QUANTITY = 0
        @@mfrc = MFRecipeComponents.new # static class which holds all the recipies and components.
        @comps = []
    end

    private
    def calc_profits sale_cost, offer_cost # :no_doc
        # Internal method, calculates profits and resale values and assigns them to instance level attibutes
        result_sale_value = @result_component.price.sale * @result_avg
        result_offer_value = @result_component.price.offer * @result_avg
        profit_max = ((result_sale_value * 0.85) - offer_cost).round()
        profit_per_skill_point = profit_max / @sp_component.price.value

        @target_name = @result_component.name
        @target_img = @result_component.img
        @cost = {  "order" => GoldPrice.to_g(offer_cost),
                    "instant" => GoldPrice.to_g(sale_cost)
        }
        @value = { "order" => GoldPrice.to_g(result_offer_value),
                    "instant" => GoldPrice.to_g(result_sale_value),
        }
        @profit = { "max" => GoldPrice.to_g(profit_max),
                    "per_sp" => GoldPrice.to_g(profit_per_skill_point)
        }
    end

    public
    def self.table_header
        # Generates a table header for HTML output
            %{
                <thead><th></th><th>Target Component</th><th>Profit: <br/>Per SP (Per Combine)</th><th>Value</th>
                <th>Cost</th><th>Recipe</th></thead>
            }
    end

    def as_tr cls=""
        # Generates pricing/cost information as a table row for HTML output
        # accepts a single parameter which is the name of the class for the tr/table row
        str = %{
            <tr class="#{cls}">
            <td><img src='#{@target_img}'/></td>
            <td>#{@target_name}</td><td><b>#{@profit['per_sp']}</b> <br/> (#{@profit['max']})</td>
            <td><b>#{@value['instant']}</b><br/> (#{@value['order']})</td><td><b>#{@cost['order']}</b>
            <br/> (#{@cost['instant']})</td>
            <td style="vertical-align:middle;">
        }

        (0..2).each do |i|
            tp = ""
            if @comps[i].quantity > 1
                tp = "Total: " + GoldPrice.to_g(@comps[i].quantity * @comps[i].price.offer)
            end
            str += %{
                <img style="width:25;height:25px" title="#{@comps[i].name}
                #{GoldPrice.to_g(@comps[i].price.offer)} each  #{tp}" src="#{@comps[i].img}"/>&nbsp;x #{@comps[i].quantity}&nbsp;
            }
        end

        str += %{
            </td>
            </tr>
        }
    end

    def forge
        assemble
        sale_cost = @calc_cost[ @comps[0].price.sale, @comps[1].price.sale, @comps[2].price.sale ]
        offer_cost = @calc_cost[ @comps[0].price.offer, @comps[1].price.offer, @comps[2].price.offer ]
        calc_profits(sale_cost, offer_cost)
    end

end

class CraftingMaterialRecipe < MFRRecipe
        protected
        def initialize component_name, tier
		super(component_name)
		@target_tier = tier
		@base_tier = tier - 1
		@result_avg = 6
		@calc_cost = lambda {|btc, ttc, dc| (btc * @BASE_QUANTITY) + ttc + (dc * @base_tier)}
		@sp_component = Component.new "Philosopher's Stone", 0, 0.5
		@result_component = @@mfrc.get(@component_name, @target_tier)
	end

        def assemble()
		@comps << [@@mfrc.get(@component_name, @base_tier), @BASE_QUANTITY]
                @comps << [@@mfrc.get(@component_name, @target_tier), 1]
		@comps << [@@mfrc.get("Dust", @target_tier), @base_tier]
        end

        public
	def as_tr cls=""
		super(cls==""? @target_tier==6?"lvl1":"lvl2": cls)
	end

end

# == Common Craftng Recipe
class CommonRecipe < CraftingMaterialRecipe
        def initialize component_name, tier
		super(component_name, tier)
		@BASE_QUANTITY = 250
		tier == 6? @result_avg = 20 : @result_avg = 80 
		@sp_component = Component.new "Philosopher's Stone", 0, @target_tier * 0.1
		forge
	end

end

# == Fine Crafting Recipe
class FineRecipe < CraftingMaterialRecipe
        def initialize component_name, tier
		super(component_name, tier)
		@BASE_QUANTITY = 50
		forge
	end
end

# == Core/Lodestone
class LodestoneRecipe <  CraftingMaterialRecipe
        def initialize component_name, tier
		super(component_name, tier)
		@BASE_QUANTITY = 2
		@result_avg = 1
                # 2560 is for wine, this needs to be added as a valid component
		@calc_cost = lambda {|btc, ttc, dc| (btc * @BASE_QUANTITY) + 2560 + (dc * 1)}
		@sp_component = Component.new "Crystals", 0, 0.8333 
		forge
	end

        def assemble
		@comps << [@@mfrc.get(@component_name, @base_tier), @BASE_QUANTITY]
                @comps << [@@mfrc.get("Bottle Of Elonian Wine"), 1]
		@comps << [@@mfrc.get("Dust", @target_tier+1), 1]
        end

	def as_tr
		super (@target_tier==5?"lvl1":"lvl2")
	end
end

class DustRecipe <  CraftingMaterialRecipe
        def initialize component_name, tier
            super(component_name, tier)

            @BASE_QUANTITY = 250
            @result_avg =  20
            @calc_cost = lambda {|btc, ttc, dc| (btc * @BASE_QUANTITY) + ttc }
            @sp_component = Component.new "Crystals", 0, 3.5 
            forge
	end
end

# == Weapon Recipe
class MysticWeaponRecipe < MFRRecipe
    def initialize component_name
        super(component_name)

        @result_component = @@mfrc.get("Mystic Weapon")[@component_name][0]
        @calc_cost = lambda {|cc, c1, c2| (cc * 30) + (c1 * 5) + (c2 * 5)}
        @result_avg = 1
        @sp_component = Component.new "Eldritch Scroll",0, 50
        forge
    end

    def assemble
        @comps << [@@mfrc.get("Mystic Coin"), 30]
        @comps << [@@mfrc.get("Mystic Weapon")[@component_name][1], 5]
        @comps << [@@mfrc.get("Mystic Weapon")[@component_name][2], 5]
    end

    def as_tr
        super "lvl0"
    end
end

class MysticForgeRecipe < MFRRecipe
        def initialize component_name, type="Mystic Forge"
	    super(component_name)
	    @type = type
	    @sp_component = Component.new "Eldritch Scroll",0, 50
	    @result_avg = 1
            @result_component = @@mfrc.get(@type)[@component_name][0]
	    forge
	end

        def assemble
		(1..3).each do |i|
			@comps << @@mfrc.get(@type)[@component_name][i]
                        # deal with the circumstance where we have a string rather than a component
			if @comps[-1][0].kind_of? String
				begin
                                        # if its a string we should be able to look it up in the component table
					@comps[-1][0] = @@mfrc.get(@comps[-1][0])
				rescue
                                        # however there is the occassional circumstance where it is a gift and needs 
                                        # special treatment
					@comps[-1][0] = GiftRecipe.new(@comps[-1][0])
				end
			end
		end
        end

	def forge
                assemble
		sale_cost = @comps.inject(0.0) { | sum, el | sum + (el[0].price.sale * el[1]) }
		offer_cost = @comps.inject(0.0) { | sum, el | sum + (el[0].price.offer * el[1]) }
		calc_profits(sale_cost, offer_cost)
	end

	def self.each &block
            # Provide a method to iterate over all the "Mystic Forge" items
            # without having to directly refence them
	    type="Mystic Forge"
	    @@mfrc.get(type).keys.each &block
	end
end

class GiftRecipe < MysticForgeRecipe
	attr_accessor :name, :price, :img, :quantity
        def initialize component_name
	    super(component_name, "Gift")
            @name = component_name
            @img = @result_component.img
            @quantity = 1
	end

	def calc_profits sale_cost, offer_cost
	    @price = GoldPrice.new(0, sale_cost, offer_cost)
	end
end

# == Pendant Recipe


