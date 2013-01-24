# == mf_recipe_component
# Description:  Basically a massive list of components and their associated ids on gw2spidy. Note
# however that weapons are an exapanded case since the component basically specifies the recipie
#
require_relative 'component'
require_relative 'price'

class MFRecipeComponents
    def initialize
        @cmp = {

# Common Materials
            "Ore" => [
                Component.new("Copper Ore", 19697),
                Component.new("Iron Ore", 19699),
                Component.new("Gold Ore", 19698),
                Component.new("Platinum Ore", 19702),
                Component.new("Mithril Ore", 19700),
                Component.new("Orichalcum Ore", 19701),
            ],

            "Cloth" => [
                Component.new("Jute Scrap", 19718),
                Component.new("Wool Scrap", 19739),
                Component.new("Cotton Scrap", 19741),
                Component.new("Linen Scrap", 19743),
                Component.new("Silk Scrap", 19748),
                Component.new("Gossamer Scrap", 19745),
            ],

            "Leather" => [
            ],

            "Wood" => [
            ],
# Fine materials

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

            "Claw" => [
                    Component.new("Tiny Claw", 24346),
                    Component.new("Small Claw", 24347),
                    Component.new("Claw", 24348),
                    Component.new("Sharp Claw", 24349),
                    Component.new("Large Claw", 24350),
                    Component.new("Vicious Claw", 24351)
            ],
            "Fang" => [
                    Component.new("Tiny Fang", 24352),
                    Component.new("Small Fang", 24353),
                    Component.new("Fang", 24354),
                    Component.new("Sharp Fang", 24355),
                    Component.new("Large Fang", 24356),
                    Component.new("Vicious Fang", 24357)
            ],

            "Scale" => [
                    Component.new("Tiny Scale", 24284),
                    Component.new("Small Scale", 24285),
                    Component.new("Scale", 24286),
                    Component.new("Smooth Scale", 24287),
                    Component.new("Large Scale", 24288),
                    Component.new("Armored Scale", 24289),
            ],

            "Bone" => [
                    Component.new("Tiny Bone", 24342),
                    Component.new("Small Bone", 24343),
                    Component.new("Bone", 24344),
                    Component.new("Heavy Bone", 24345),
                    Component.new("Large Bone", 24341),
                    Component.new("Ancient Bone", 24358)
            ],

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

# Mystic Weapons

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

# Gifts
"Gift" => [{
    "Gift Of Light" => [ [Component.new("Gift Of Light", 0)], [Component.new("Orichalcum Ingot", 19685), 250], [Component.new("Cured Hardened Leather Square",19737 ), 250], [Component.new("Charged Lodestone", 24305 ), 100] ]
#	"Gift Of Spiders" => [ ],
#	"Gift Of Lightning" => [ ],
#	"Gift Of Souls" => [ ],
#	"Gift Of The Moon" => [ ],
#	"Gift Of Ice" => [ ]
}],

# "Other" Mystic forge recipies
"Mystic Forge" => [{
	"Accursed Chains" => [Component.new("Accursed Chains", 31046), ["Mystic Coin", 30], [Component.new("Steel Ingot", 19688 ), 250], [Component.new("Orichalcum Ingot", 19685), 50]],
	"Abyssal Scepter" => [Component.new("Abyssal Scepted", 31058), ["Mystic Coin", 100], [Component.new("Glob Of Ectoplasm", 19721 ), 250], [Component.new("Ancient Scepter Rod", 12976), 250]],
	"Aether" => [Component.new("Aether", 31074), ["Mystic Coin", 100], ["Gift Of Light", 1], [Component.new("Ancient Shortbow Stave", 12947), 250]],
	"Azureflame" => [Component.new("Azureflame", 31071), ["Mystic Coin", 100], ["Gift Of Light", 1], [Component.new("Ancient Longbow Stave", 12941), 250]],
	"Coogouloosh" => [Component.new("Cooguloosh", 31040), ["Mystic Coin", 30], [Component.new("Coral Orb", 24522 ), 30 ], [Component.new("Opal Orb", 24510), 30]],
	#"Cragstone" => [Component.new("Cragstone", 31059), ["Mystic Coin", 100], [Component.new("Coral Orb", 24522 ), 30 ], [Component.new("Opal Orb", 24510), 30]],
	"The Anomoly" => [Component.new("The Anomoly", 31045), ["Mystic Coin", 100], [Component.new("Coral Orb", 24522 ), 1 ], ["Glob Of Ectoplasm", 250]],


			}],
        "Glob Of Ectoplasm" => [ Component.new("Glob Of Ectoplasm", 19721) ],
        "Mystic Coin" => [ Component.new("Mystic Coin", 19976) ],
        "Bottle Of Elonian Wine" => [Component.new("Bottle of Elonian Wine", 19633, 2630)]
        
	}
    end

    def get name, tier=1
	@cmp[name][tier-1]
    end
end
