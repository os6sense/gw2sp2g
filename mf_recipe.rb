# == mf_recipe 
# Description: Provides a mechanism to calculate the return (in terms of gold made) via converting skill points into various items at the Mystic Toil^h^h^h^hForge.
#
require_relative 'component'
require_relative 'price'
require_relative 'mf_recipe_components'

# == Base class
class MFRRecipe
	def initialize component_name
		@component_name = component_name
		@BASE_QUANTITY = 0
		@@mfrc = MFRecipeComponents.new # static class which holds all the recipies and components. 
	end

	def self.table_header
		# Generates a table header for HTML output
		"<thead><th></th><th>Target Component</th><th>Profit: Per SP (Per Combine)</th><th>Value</th>" +
		"<th>Cost</th></thead>"
	end

	def as_tr cls
		# Generates pricing/cost information as a table row for HTML output
		# accepts a single parameter which is the name of the class for the tr/table row
		"<tr class=\"#{cls}\">" +
		"<td><img src='#{@target_img}'/></td>" +
		"<td>#{@target_name}</td><td><b>#{@profit['per_sp']}</b> (#{@profit['max']})</td>" +
		"<td><b>#{@value['instant']}</b> (#{@value['order']})</td><td><b>#{@cost['order']}</b>" +
		" (#{@cost['instant']})</td></tr>\r\n"
	end

	def calc_profits target_tier_component, sale_cost, offer_cost 
		# Internal method, calculates profits and resale values and assigns them to instance level attibutes
		result_sale_value = target_tier_component.price.sale * @result_avg
		result_offer_value = target_tier_component.price.offer * @result_avg
		profit_max = ((result_sale_value * 0.85) - offer_cost).round()
		profit_per_skill_point = profit_max / @sp_component.price.value

		@target_name = target_tier_component.name
		@target_img = target_tier_component.img
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
end


class CraftingMaterialRecipe < MFRRecipe
        def initialize component_name, tier
		super(component_name)
		@target_tier = tier 
		@base_tier = tier - 1 
		@result_avg = 6 
		@calc_cost = lambda {|btc, ttc, dc| (btc * @BASE_QUANTITY) + ttc + (dc * 5)}
		@sp_component = Component.new "Philosopher's Stone", 0, 0.5 
	end

	def forge
		base_tier_component = @@mfrc.get(@component_name, @base_tier)
		target_tier_component = @@mfrc.get(@component_name, @target_tier)
		dust_component = @@mfrc.get("Dust", @target_tier)

		sale_cost = @calc_cost[ base_tier_component.price.sale, target_tier_component.price.sale, dust_component.price.sale ] 
		offer_cost = @calc_cost[ base_tier_component.price.offer, target_tier_component.price.offer, dust_component.price.offer ] 

		calc_profits(target_tier_component, sale_cost, offer_cost)
	end


end

# == Common Craftng Recipe
class CommonRecipe < CraftingMaterialRecipe
        def initialize component_name, tier
		super(component_name, tier)
		@BASE_QUANTITY = 250
		@result_avg = 80
		@result_avg = 20 if tier==6
		
	
		
		@sp_component = Component.new "Philosopher's Stone", 0, @target_tier * 0.1 
		forge
	end

	def as_tr
		super(@target_tier==6?"lvl1":"lvl2")
	end
end

# == Fine Crafting Recipe
class FineRecipe < CraftingMaterialRecipe
        def initialize component_name, tier
		super(component_name, tier)
		@BASE_QUANTITY = 50
		forge
	end

	def as_tr
		super(@target_tier==6?"lvl1":"lvl2")
	end
end

# == Core/Lodestone
class LodestoneRecipe <  CraftingMaterialRecipe
        def initialize component_name, tier
		super(component_name, tier)
		@BASE_QUANTITY = 2
		@result_avg = 1 
		@calc_cost = lambda {|btc, ttc, dc| (btc * @BASE_QUANTITY) + 2560 + (dc * 1)}
		@sp_component = Component.new "Crystals", 0, 0.8333
		forge
	end

	def as_tr
		super (@target_tier==5?"lvl1":"lvl2") 
	end
end

# == Weapon Recipe
class MysticWeaponRecipe < MFRRecipe
        def initialize component_name
		super(component_name)
		@sp_component = Component.new "Eldritch Scroll",0, 50
		@calc_cost = lambda {|cc, c1, c2| (cc * 30) + (c1 * 5) + (c2 * 5)}
		@result_avg = 1 
		forge
	end

	def forge 
		coin_comp = @@mfrc.get("Mystic Coin")
		comp1 = @@mfrc.get("Mystic Weapon")[@component_name][1]
		comp2 = @@mfrc.get("Mystic Weapon")[@component_name][2]

		result_comp = @@mfrc.get("Mystic Weapon")[@component_name][0]

		sale_cost = @calc_cost[ coin_comp.price.sale, comp1.price.sale, comp2.price.sale ] 
		offer_cost = @calc_cost[ coin_comp.price.offer, comp1.price.offer, comp2.price.offer ] 

		calc_profits(result_comp, sale_cost, offer_cost)
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
		forge
	end

	def forge 
		result_comp = @@mfrc.get(@type)[@component_name][0]

		comps = []
		(1..3).each do |i|
			comps << @@mfrc.get(@type)[@component_name][i]
			if not comps[-1][0].kind_of? Component
				begin
					comps[-1][0] = @@mfrc.get(comps[-1][0]) 
				rescue
					warn @component_name
					warn comps[-1][0]
					comps[-1][0] = GiftRecipe.new(comps[-1][0])
				end
			end
		end

		sale_cost = comps.inject(0.0) { | sum, el | sum + (el[0].price.sale * el[1]) }
		offer_cost = comps.inject(0.0) { | sum, el | sum + (el[0].price.offer * el[1]) }

		calc_profits(result_comp, sale_cost, offer_cost)
	end

	def self.each &block
		type="Mystic Forge"
		@@mfrc.get(type).keys.each &block 
	end

	def as_tr
		super "lvl0"
	end
end

class GiftRecipe < MysticForgeRecipe 
	attr_accessor :price
        def initialize component_name
		super(component_name, "Gift")
	end

	def calc_profits result_comp, sale_cost, offer_cost
		@price = GoldPrice.new(0, sale_cost, offer_cost)
		warn @price.sale
	end

	
end

# == Dust Recipie


# == Pendant Recipe


# == Skill Point components
#elonian_wine = Component.new("Bottle of Elonian Wine", 19633)
# == Dust Recipie


# == Pendant Recipe


# == Skill Point components
#FineRecipe.new("Totem", 6).forge

#LodestoneRecipe.new("Crystal", 5).forge

#WeaponRecipe.new("Claymore").forge

