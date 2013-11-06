# == mf_recipe 
# Description: Provides a mechanism to calculate the return (in terms of gold made) via converting skill points into various items at the Mystic Toil^h^h^h^hForge.
#
#
#
#
require_relative 'component'
require_relative 'price'

class MFRecipeComponents 
	def initialize
		@cmp = {
			"Blood" => [ 
				Component.new("Vial of Weak Blood", 24290),
				Component.new("Vial of Thin Blood", 24291),
				Component.new("Vial of Blood", 24292),
				Component.new("Vial of Thick Blood", 24293),
				Component.new("Vial of Potent Blood", 24294),
				Component.new("Vial of Powerful Blood", 24295)
			],

			"Venom" => [
				Component.new("Tiny Venom Sac", 24278),
				Component.new("Small Venom Sac", 24279),
				Component.new("Venom Sac", 24280),
				Component.new("Full Venom Sac", 24281),
				Component.new("Potent Venom Sac", 24282),
				Component.new("Powerful Venom Sac", 24283)
			],

			"Totem" => [
				Component.new("Tiny Totem", 24296),
				Component.new("Small Totem", 24297),
				Component.new("Totem", 24298),
				Component.new("Engraved Totem", 24363),
				Component.new("Intricate Totem", 24299),
				Component.new("Elaborate Totem", 24300),
			],

			"Dust" => [
				Component.new("Pile of Glittering Dust", 24272),
				Component.new("Pile of Shimmering Dust", 24273),
				Component.new("Pile of Radiant Dust", 24274),
				Component.new("Pile of Luminous Dust", 24275),
				Component.new("Pile of Incandescent Dust", 24276),
				Component.new("Pile of Chrystaline Dust", 24277)
			],

			"Claw" => [],
			"Fang" => [],
			"Scale" => [],
			"Bone" => [],

			"Charged" => [
				Component.new("Charged Sliver", 24301),
				Component.new("Charged Fragement", 24302),
				Component.new("Charged Shard", 24303),
				Component.new("Charged Core", 24304),
				Component.new("Charged Lodestone", 24305)
			],
			"Onyx" => [
				Component.new("Onyx Sliver", 24306),
				Component.new("Onyx Fragement", 24307),
				Component.new("Onyx Shard", 24308),
				Component.new("Onyx Core", 24309),
				Component.new("Onyx Lodestone", 24310)
			],
			"Molten" => [
				Component.new("Molten Sliver", 24311),
				Component.new("Molten Fragement", 24312),
				Component.new("Molten Shard", 24313),
				Component.new("Molten Core", 24314),
				Component.new("Molten Lodestone", 24315)
			],
			"Crystal" => [
				Component.new("Crystal Sliver", 24326),
				Component.new("Crystal Fragement", 24327),
				Component.new("Crystal Shard", 24328),
				Component.new("Crystal Core", 24329),
				Component.new("Crystal Lodestone", 24330)
			],
			"Corrupted" => [
				Component.new("Corrupted Sliver", 24336),
				Component.new("Corrupted Fragement", 24337),
				Component.new("Corrupted Shard", 24338),
				Component.new("Corrupted Core", 24339),
				Component.new("Corrupted Lodestone", 24340)
			],
			"Destroyer" => [
				Component.new("Destroyer Sliver", 24321),
				Component.new("Destroyer Fragement", 24322),
				Component.new("Destroyer Shard", 24323),
				Component.new("Destroyer Core", 24324),
				Component.new("Destroyer Lodestone", 24325)
			],

			"Mystic Weapon" => [{
				"Artifact" => [Component.new("Mystic Artifact", 31083), Component.new("Ancient Focus Casing", 12982 ), Component.new("Ancient Focus Core", 13243 ) ],
				"Barricade" => [Component.new("Mystic Barricade", 31091), Component.new("Orichalcum Shield Bacing", 12906), Component.new("Orichalcum Shield Boss", 12912) ],
				"Battleaxe" => [Component.new("Mystic Battleaxe", 31085), Component.new("Orichalcum Axe Blade", 12852), Component.new("Small Ancient Haft", 12892)],
				"Battlehammer" => [Component.new("Mystic Battlehammer", 31097), Component.new("Orichalcum Hammer Head", 12864), Component.new("Large Ancient Haft", 12899) ],
				"Caller" => [Component.new("Mystic Caller", 31100), Component.new("Orichalcum Horn", 12936 ), Component.new("Orichalcum Warhorn Mouthpiece", 12930 ) ],
				"Claymore" => [Component.new("Mystic Claymore", 31086), Component.new("Orichalcum Greatsword Blade", 12840), Component.new("Orichalcum Greatsword Hilt", 12888 )],
				"Crescent" => [Component.new("Mystic Crescent", 31093), Component.new("Ancient Short-bow Stave", 12947 ), Component.new("Hardened String", 12963 ) ],
				"Cudgel" => [Component.new("Mystic Cudgel", 31104), Component.new("Orichalcum Mace Head", 12876), Component.new("Small Ancient Haft", 12892) ],
				"Hornbow" => [Component.new("Mystic Hornbow", 31094), Component.new("Ancient Longbow Stave", 12941 ), Component.new("Hardened String", 12963) ],
				"Pistol" => [Component.new("Mystic Pistol", 31096), Component.new("Orichalcum Pistol Barrel", 12924), Component.new("Ancient Pistol Frame", 12959) ],
				"Rifle" => [Component.new("Mystic Rifle", 31098), Component.new("Orichalcum Rifle Barrel", 12918), Component.new("Ancient Rifle Stock", 12953) ],
				"Spear" => [Component.new("Mystic Spear", 31089), Component.new("Orichalcum Spear Head", 12998 ), Component.new("Large Ancient Haft", 12899 ) ],
				"Speargun" => [Component.new("Mystic Speargun", 31101), Component.new("Ancient Harpoon", 13051 ), Component.new("Ancient Rifle Stock", 12953)],
				"Spike" => [Component.new("Mystic Spike", 31108), Component.new("Orichalcum Dagger Blade", 12858 ), Component.new("Ancient Dagger Hilt", 12882)],
				"Staff" => [Component.new("Mystic Staff", 31092), Component.new("Ancient Staff Head", 13261), Component.new("Ancient Staff Shaft", 12973),  ],
				"Sword" => [Component.new("Mystic Sword", 31095), Component.new("Orichalcum Sword Blade", 12870 ), Component.new("Orichalcum Sword Hilt", 12846 ) ],
				"Torch" => [Component.new("Mystic Torch", 31099), Component.new("Orichalcum Torch Head", 13061), Component.new("Ancient Torch Handle", 13014)],
				"Trident" => [Component.new("Mystic Trident", 31102), Component.new("Orichalcum Trident Head", 13004 ), Component.new("Ancient Trident Shaft", 12253 ) ],
				"Wand" => [Component.new("Mystic Wand", 31090), Component.new("Ancient Scepter Core", 13255), Component.new("Ancient Scepter Rod", 12976 )]
			}],

			"Mystic Coin" => [
				Component.new("Mystic Coin", 19976)
			]

			
		}
	end

	def get name, tier=1
		@cmp[name][tier-1]	
	end
end


# == Base class
class MFRRecipe
	def initialize
		@BASE_QUANTITY = 0
		@@mfrc = MFRecipeComponents.new  
	end
end


class CraftingMaterialRecipe < MFRRecipe

        def initialize component_name, tier
		super()
		@component_name = component_name
		@target_tier = tier 
		@base_tier = tier - 1 
		@result_avg = 6 
		@calc_cost = lambda {|btc, ttc, dc| (btc * @BASE_QUANTITY) + ttc + (dc * 5)}
		@sp_component = Component.new "Philosopher's Stone", 0, 2
	end

	def forge
		base_tier_component = @@mfrc.get(@component_name, @base_tier)
		target_tier_component = @@mfrc.get(@component_name, @target_tier)
		dust_component = @@mfrc.get("Dust", @target_tier)

		sale_cost = @calc_cost[ base_tier_component.price.sale, target_tier_component.price.sale, dust_component.price.sale ] 
		offer_cost = @calc_cost[ base_tier_component.price.offer, target_tier_component.price.offer, dust_component.price.offer ] 

		result_sale_value = target_tier_component.price.sale * @result_avg
		result_offer_value = target_tier_component.price.offer * @result_avg
		profit_max = ((result_sale_value - offer_cost) / 100.00 * 85.00).round()
		profit_per_skill_point = profit_max * @sp_component.price.value

		print "-- #{target_tier_component.name} --------------------------------------\r\n"
		print  " (#{base_tier_component.price.offer*50} ,  #{target_tier_component.price.offer}, #{dust_component.price.offer*5}\r\n"
		print "COST        : #{GoldPrice.to_g(sale_cost)} (#{GoldPrice.to_g(offer_cost)})\r\n"
		print "RESULT VALUE: #{GoldPrice.to_g(result_sale_value)} (#{GoldPrice.to_g(result_offer_value)})\r\n"
		print "MAX PROFIT  : #{GoldPrice.to_g(profit_max)}\r\n"
		print "PROFIT SP   : #{GoldPrice.to_g(profit_per_skill_point)}\r\n"
		print "------------------------------------------------------------------\r\n"
	end
end

# == Common Craftng Recipe
class CommonRecipe < CraftingMaterialRecipe

        def initialize component_name, tier
		super(component_name, tier)
		@BASE_QUANTITY = 250
	end
end


# == Fine Crafting Recipe
class FineRecipe < CraftingMaterialRecipe
        def initialize component_name, tier
		super(component_name, tier)
		@BASE_QUANTITY = 50
	end
end

# == Core/Lodestone
class LodestoneRecipe <  CraftingMaterialRecipe
        def initialize component_name, tier
		super(component_name, tier)
		@BASE_QUANTITY = 2
		@result_avg = 1 
		@calc_cost = lambda {|btc, ttc, dc| (btc * @BASE_QUANTITY) + 2560 + (dc * 1)}
		@sp_component = Component.new "Crystals", 0, 0.66 
	end
end

# == Weapon Recipe
class WeaponRecipe < MFRRecipe
        def initialize component_name
		super()
		@component_name = component_name
		@sp_component = Component.new "Eldritch Scroll",0, 50
	end

	def forge 
		coin_comp = @@mfrc.get("Mystic Coin")
		result_comp = @@mfrc.get("Mystic Weapon")[@component_name][0]
		comp1 = @@mfrc.get("Mystic Weapon")[@component_name][1]
		comp2 = @@mfrc.get("Mystic Weapon")[@component_name][2]

		@calc_cost = lambda {|cc, c1, c2| (cc * 30) + (c1 * 5) + (c2 * 5)}

		sale_cost = @calc_cost[ coin_comp.price.sale, comp1.price.sale, comp2.price.sale ] 
		offer_cost = @calc_cost[ coin_comp.price.offer, comp1.price.offer, comp2.price.offer ] 

		result_sale_value = result_comp.price.sale 
		result_offer_value = result_comp.price.offer 
		profit_max = ((result_sale_value - offer_cost) / 100.00 * 85.00).round()
		profit_per_skill_point = profit_max / 50 

		print "-- #{result_comp.name} --------------------------------------\r\n"
		print "COST        : #{GoldPrice.to_g(sale_cost)} (#{GoldPrice.to_g(offer_cost)})\r\n"
		print "RESULT VALUE: #{GoldPrice.to_g(result_sale_value)} (#{GoldPrice.to_g(result_offer_value)})\r\n"
		print "MAX PROFIT  : #{GoldPrice.to_g(profit_max)}\r\n"
		print "PROFIT SP   : #{GoldPrice.to_g(profit_per_skill_point)}\r\n"
		print "------------------------------------------------------------------\r\n"
	end
end

# == Dust Recipie


# == Pendant Recipe


# == Skill Point components
#elonian_wine = Component.new("Bottle of Elonian Wine", 19633)

FineRecipe.new("Totem", 6).forge
FineRecipe.new("Blood", 6).forge
FineRecipe.new("Venom", 6).forge

LodestoneRecipe.new("Charged", 5).forge
LodestoneRecipe.new("Destroyer", 5).forge
LodestoneRecipe.new("Molten", 5).forge
LodestoneRecipe.new("Corrupted", 5).forge
LodestoneRecipe.new("Onyx", 5).forge
LodestoneRecipe.new("Crystal", 5).forge

WeaponRecipe.new("Pistol").forge
WeaponRecipe.new("Claymore").forge

LodestoneRecipe.new("Charged", 2).forge
LodestoneRecipe.new("Charged", 3).forge
LodestoneRecipe.new("Charged", 4).forge
LodestoneRecipe.new("Charged", 5).forge
