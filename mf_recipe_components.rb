# == mf_recipe_component
# Description:  Basically a massive list of components and their associated ids on gw2spidy. Note
# however that weapons are an exapanded case since the component basically specifies the recipie
#
require_relative 'component'
require_relative 'price'
require_relative 'mf_recipe'
#require 'singleton'

class MFRecipeComponents
    #include Singleton

    def each &block
        @cmp.values.each &block
    end

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
                Component.new("Rawhide Leather Section", 19719),
                Component.new("Thin Leather Section", 19728),
                Component.new("Course Leather Section", 19730),
                Component.new("Rugged Leather Section", 19731),
                Component.new("Thick Leather Section", 19729),
                Component.new("Hardened Leather Section", 19732),
            ],

            "Wood" => [
                Component.new("Green Wood Log", 19723),
                Component.new("Soft Wood Log", 19726),
                Component.new("Seasoned Wood Log", 19727),
                Component.new("Hard Wood Log", 19724),
                Component.new("Elder Wood Log", 19722),
                Component.new("Ancient Wood Log", 19725),
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
        "Artifact" => [ Component.new("Mystic Artifact", 31083), Component.new("Ancient Focus Casing", 12982 ), Component.new("Ancient Focus Core", 13243 ) ],
        "Barricade" => [ Component.new("Mystic Barricade", 31091), "Orichalcum Shield Bacing", "Orichalcum Shield Boss" ],
        "Battleaxe" => [ Component.new("Mystic Battleaxe", 31085), "Orichalcum Axe Blade", "Small Ancient Haft" ],
        "Battlehammer" => [ Component.new("Mystic Battlehammer", 31097), Component.new("Orichalcum Hammer Head", 12864), Component.new("Large Ancient Haft", 12899) ],
        "Caller" => [ Component.new("Mystic Caller", 31100), Component.new("Orichalcum Horn", 12936 ), Component.new("Orichalcum Warhorn Mouthpiece", 12930 ) ],
        "Claymore" => [ Component.new("Mystic Claymore", 31086), "Orichalcum Greatsword Blade", "Orichalcum Greatsword Hilt" ],
        "Crescent" => [ Component.new("Mystic Crescent", 31093), "Ancient Shortbow Stave", Component.new("Hardened String", 12963 ) ],
        "Cudgel" => [ Component.new("Mystic Cudgel", 31104), Component.new("Orichalcum Mace Head", 12876), Component.new("Small Ancient Haft", 12892) ],
        "Hornbow" => [ Component.new("Mystic Hornbow", 31094), "Ancient Longbow Stave", Component.new("Hardened String", 12963) ],
        "Pistol" => [ Component.new("Mystic Pistol", 31096), "Orichalcum Pistol Barrel", "Ancient Pistol Frame" ],
        "Rifle" => [ Component.new("Mystic Rifle", 31098), Component.new("Orichalcum Rifle Barrel", 12918), Component.new("Ancient Rifle Stock", 12953) ],
        "Spear" => [ Component.new("Mystic Spear", 31089), Component.new("Orichalcum Spear Head", 12998 ), Component.new("Large Ancient Haft", 12899 ) ],
        "Speargun" => [ Component.new("Mystic Speargun", 31101), Component.new("Ancient Harpoon", 13051 ), Component.new("Ancient Rifle Stock", 12953)],
        "Spike" => [ Component.new("Mystic Spike", 31108), Component.new("Orichalcum Dagger Blade", 12858 ), Component.new("Ancient Dagger Hilt", 12882)],
        "Staff" => [ Component.new("Mystic Staff", 31092), "Ancient Staff Head", "Ancient Staff Shaft" ],
        "Sword" => [ Component.new("Mystic Sword", 31095), "Orichalcum Sword Blade", "Orichalcum Sword Hilt" ],
        "Torch" => [ Component.new("Mystic Torch", 31099), Component.new("Orichalcum Torch Head", 13061), Component.new("Ancient Torch Handle", 13014)],
        "Trident" => [ Component.new("Mystic Trident", 31102), Component.new("Orichalcum Trident Head", 13004 ), Component.new("Ancient Trident Shaft", 12253 ) ],
        "Wand" => [ Component.new("Mystic Wand", 31090), Component.new("Ancient Scepter Core", 13255), Component.new("Ancient Scepter Rod", 12976 )]
    }],

    # Gifts
    "Gift" => [{
        "Gift Of Light" => [ [ Component.new("Gift Of Light", 19632)], ["Orichalcum Ingot", 250], [ Component.new("Cured Hardened Leather Square",19737 ), 250], ["Charged Lodestone", 100] ],
    #	"Gift Of Spiders" => [ ],
	"Gift Of Lightning" => [Component.new("Gift Of Lightning", 19639), ["Orichalcum Ingot", 250], ["Charged Lodestone", 100 ], ["Bolt Of Gossamer", 250] ],
    #	"Gift Of Souls" => [ ],
    #	"Gift Of The Moon" => [ ],
	"Gift Of Ice" => [ [ Component.new("GIft Of Ice", 19624)], ["Orichalcum Ingot", 250], ["Glacial Lodestone", 100 ], ["Corrupted Lodestone", 100] ],
        "Vial Of Liquid Flame" => [ Component.new("Vial Of Liquid Flame", 19634), ["Ghost Pepper", 250], ["Molten Lodestone", 100], ["Destroyer Lodestone", 100] ]

    }],

    # "Other" Mystic forge recipies
    "Mystic Forge" => [{
	"Accursed Chains" => [ Component.new("Accursed Chains", 31046), ["Mystic Coin", 30], [ "Steel Ingot", 250], ["Orichalcum Ingot", 50] ],
	"Abyssal Scepter" => [ Component.new("Abyssal Scepted", 31058), ["Mystic Coin", 100], ["Glob Of Ectoplasm", 250], [ Component.new("Ancient Scepter Rod", 12976), 250] ],
	"Aether" => [ Component.new("Aether", 31074), ["Mystic Coin", 100], ["Gift Of Light", 1], ["Ancient Shortbow Stave", 250] ],
	"Azureflame" => [ Component.new("Azureflame", 31071), ["Mystic Coin", 100], ["Gift Of Light", 1], [ Component.new("Ancient Longbow Stave", 12941), 250] ],
	"Coogouloosh" => [ Component.new("Cooguloosh", 31040), ["Mystic Coin", 30], ["Coral Orb", 30 ], ["Opal Orb", 30] ],
	"The Anomoly" => [ Component.new("The Anomoly", 31045), ["Mystic Coin", 100], ["Bloodstone Shard", 1 ], ["Glob Of Ectoplasm", 250] ],
        "Dreadwing" => [ Component.new("Dreadwing", 31037 ), ["Mystic Coin", 10], ["Small Ancient Haft", 10], ["Onyx Lodestone", 10] ],
        "Ilya" => [ Component.new("Ilya", 31076 ), ["Mystic Coin", 50], ["Glob Of Ectoplasm", 250], ["Ancient Pistol Frame", 250] ],
        "Ambrosia" => [ Component.new("Ambrosia", 31038 ), ["Mystic Coin", 10], ["Orichalcum Ingot", 10], ["Stein of Highlander Beer", 1] ],
        #"Arachnophobia" => [ Component.new("Arachnophobia", 36051 ), ["Mystic Coin", 100], ["Gift of Spiders", 1], ["Superior Sigil of the Night", 20] ],
        "Courage" => [ Component.new("Courage", 31042 ), ["Mystic Coin", 20], ["Pile Of Chrystaline Dust", 20], ["Bottle Of Elonian Wine", 1] ],
        #"Cragstone" => [ Component.new("Cragstone", 31059 ), ["Mystic Coin", 20], ["Obsidian Shard", 50], ["Onyx Lodestone", 250] ],
        "Eidolon" => [ Component.new("Eidolon", 31062 ), ["Mystic Coin", 100], ["Gift Of Light", 1], ["Orichalcum Shield Boss", 250] ],
        "Eye of Rodgort" => [ Component.new("Eye of Rodgort", 31056 ), ["Mystic Coin", 100], ["Vial Of Powerful Blood", 250], ["Lidless Eye", 1] ],
        "Firebringer" => [ Component.new("Firebringer", 31064 ), ["Mystic Coin", 30], ["Orichalcum Sword Blade", 250], ["Molten Lodestone", 50] ],
        "Flux Matrix" => [ Component.new("Flux Matrix", 31082 ), ["Mystic Coin", 40], ["SPCrystal", 60], ["Pile Of Chrystaline Dust", 100] ],
        "Foefire's Essence" => [ Component.new("Foefire's Essence", 31077 ), ["Mystic Coin", 70], ["Gift Of Light", 1], ["Orichalcum Greatsword Blade", 250] ],
        "Foefire's Power" => [ Component.new("Foefire's Power", 31078 ), ["Mystic Coin", 100], ["Gift Of Light", 1], ["Orichalcum Hammer Head", 250] ],
        "Gaze" => [ Component.new("Gaze", 31043 ), ["Mystic Coin", 40], ["SPCrystal", 1], ["Large Skull", 50] ],
        "Glint's Scale" => [ Component.new("Glint's Scale", 31047 ), ["Mystic Coin", 30], ["SPCrystal", 30], ["Bottle Of Elonian Wine", 10] ],
        "Goblet of Kings" => [ Component.new("Goblet of Kings", 31049), ["Mystic Coin", 30], ["Gold Ingot", 250], ["Bag Of Jewels", 1] ],
        "Godswalk Enchiridion" => [ Component.new("Godswalk Enchiridion", 31041 ), ["Mystic Coin", 30], ["Pile Of Chrystaline Dust", 250], ["Siege Masters Guide", 1] ],
        "Heart of Mellaggan" => [ Component.new("Heart of Mellaggan", 31084 ), ["Mystic Coin", 30], ["Pearl", 250], ["Opal Orb", 20] ],
        "Illusion" => [ Component.new("Illusion", 31054 ), ["Mystic Coin", 50], ["Glob Of Ectoplasm", 250], ["Large Ancient Haft", 250] ],
        "Immobulus" => [ Component.new("Immobulus", 31057 ), ["Mystic Coin", 30], ["Giant Eye", 250], ["Pile Of Chrystaline Dust", 250]  ],
        "Infinite Light" => [ Component.new("Infinate Light", 31068 ), ["Mystic Coin", 100], ["Orichalcum Sword Blade", 250], ["Charged Lodestone", 250] ],
        "Jormag's Breath" => [ Component.new("Jormag's Breath", 31065 ), ["Mystic Coin", 50], ["Orichalcum Sword Blade", 100], ["Corrupted Lodestone", 50] ],
        "Jormag's Needle" => [ Component.new("Jormag's Needle", 31105 ), ["Mystic Coin", 50], ["Destroyer Lodestone", 50], ["Molten Lodestone", 50] ],
        "Jormag's Needle" => [ Component.new("Jormag's Needle", 31105 ), ["Mystic Coin", 30], ["Corrupted Lodestone", 50], ["Glacial Lodestone", 50] ],
        "Kryta's Salvation" => [ Component.new("Kryta's Salvation", 31036 ), ["Mystic Coin", 10], ["Small Ancient Haft", 10], ["Vicious Fang", 10] ],
        "Lidless Eye" => [ Component.new("Lidless Eye", 31081 ), ["Mystic Coin", 50], ["Vial Of Powerful Blood", 250], ["Giant Eye", 10] ],
        "Lyss" => [ Component.new("Lyss", 31080 ), ["Mystic Coin", 50], ["Glob Of Ectoplasm", 250], ["Orichalcum Pistol Barrel", 250] ],
        #"Malice" => [ Component.new("Malice", 31044 ), ["Mystic Coin", 30], ["Lemongrass", 100], ["Spools of Gossamer Thread", 100] ],
        "Melandru's Gaze" => [ Component.new("Melandru's Gaze", 31061 ), ["Mystic Coin", 50], ["Ancient Wood Plank", 250], ["Giant Eye", 1] ],
        "Mjolnir" => [ Component.new("Mjolnir", 31037 ), ["Mystic Coin", 100], ["Gift Of Lightning", 1], ["Charged Lodestone", 250] ],
        "Naegling" => [ Component.new("Naegling", 31087 ), ["Mystic Coin", 20], ["Orichalcum Ingot", 100], ["Vial Of Powerful Blood", 50] ],
        "Phoenix Talon" => [ Component.new("Phoenix Talon", 31035 ), ["Mystic Coin", 50], ["Orichalcum Ingot", 100], ["Ruby Orb", 50] ],
        "Reaver of the Mists" => [ Component.new("Reaver of the Mists", 31034 ), ["Mystic Coin", 50], ["Crystal Lodestone", 20], ["Glob Of Ectoplasm", 250] ],
        "Rusttooth" => [ Component.new("Rusttooth", 31066 ), ["Mystic Coin", 10], ["Steel Ingot", 10], ["Seasoned Wood Plank", 10] ],
        "Song of the Numberless Pack" => [ Component.new("Song of the umberless Pack", 31050 ), ["Mystic Coin", 20], ["Orichalcum Plated Dowel", 20], ["Orichalcum Warhorn Mouthpiece", 10] ],
        "Spirit Links" => [ Component.new("Spirit Links", 31051 ), ["Mystic Coin", 70], ["Glob Of Ectoplasm", 250], ["Orichalcum Ingot", 10] ],
        "Squeedily Spooch" => [ Component.new("Squeedily Spooch", 31048 ), ["Mystic Coin", 20], ["Amber Pebble", 250], ["Powerful Venom Sac", 100] ],
        "Stygian Blade" => [ Component.new("Stygian Blade", 31063 ), ["Mystic Coin", 50], ["Vial Of Powerful Blood", 250], ["Vicious Claw", 250] ],
        "Tear of Grenth" => [ Component.new("Tear of Grenth", 31106 ), ["Mystic Coin", 30], ["Pile Of Chrystaline Dust", 250], ["Molten Lodestone", 10] ],
        #"The Crossing" => [ Component.new("The Crossing", 36070 ), ["Mystic Coin", 100], ["Gift of Souls", 1], ["Superior Sigil of the Night", 20] ],
        "The Fate of Menzies" => [ Component.new("The Fate of Menzies", 35725 ), ["Mystic Coin", 70], ["Ancient Bone", 100], ["Molten Lodestone", 30] ],
        #"The Mad Moon",=> [ Component.new("The Mad Moon", 36056 ), ["Mystic Coin", 100], ["Gift of The Moon", 1], ["Superior Sigil of the Night", 20] ],
        "Titans' Vengance" => [ Component.new("Titans' Vengance", 31055 ), ["Mystic Coin", 50], ["Destroyer Lodestone", 50], ["Molten Lodestone", 50] ],
        "Unspoken Curse" => [ Component.new("Unspoken Curse", 31067 ), ["Mystic Coin", 50], ["Orichalcum Sword Blade", 100], ["Destroyer Lodestone", 50] ],
        "Vision of the Mists" => [ Component.new("Vision of the Mists", 31052 ), ["Mystic Coin", 100], ["Glob Of Ectoplasm", 250], ["Orichalcum Greatsword Blade", 250] ],
        "Volcanus" => [ Component.new("Volcanus", 31053 ), ["Mystic Coin", 100], ["Vial Of Liquid Flame", 1], ["Molten Lodestone", 250] ],
        "Wall of the Mists" => [ Component.new("Wall of the Mists", 31060 ), ["Mystic Coin", 50], ["Orichalcum Shield Boss", 250], ["Giant Eye", 30] ],
        "Wintersbark" => [ Component.new("Wintersbark", 31075 ), ["Mystic Coin", 100], ["Ancient Shortbow Stave", 250], ["Gift Of Ice", 1] ],
        "Wintersbite" => [ Component.new("Wintersbite", 31072 ), ["Mystic Coin", 100], ["Ancient Longbow Stave", 250], ["Gift Of Ice", 1] ],
        "Whisperblade" => [ Component.new("Whisperblade", 31069 ), ["Mystic Coin", 50], ["Glob Of Ectoplasm", 250], ["Orichalcum Sword Blade", 250] ],
        "Ignus Fatuus" => [ Component.new("Ignus Fatuus", 31088 ), ["Mystic Coin", 100], ["Glob Of Ectoplasm", 250], ["Orichalcum Spear Head", 250] ]
    }],
    "Pendant" => [{
        "Triforge Pendant" => [ Component.new("Triforge Pendant", 23095), ["Sapphire Pendant", 1],["Ruby Pendant", 1], ["Emerald Pendant",1] ],
        "Emerald Pendant" => [ Component.new("Emerald Pendant", 23096), ["Mystic Coin", 50], ["Gold Ingot", 250], ["Emerald Orb", 250] ],
        "Sapphire Pendant" => [ Component.new("Sapphire Pendant", 23098), ["Mystic Coin", 50], ["Gold Ingot", 250], ["Sapphire Orb", 250] ],
        "Ruby Pendant" => [ Component.new("Ruby Pendant", 23097), ["Mystic Coin", 50], ["Gold Ingot", 250], ["Ruby Orb", 250] ],
    }],

    "Orichalcum Pistol Barrel" => [ Component.new("Orichalcum Pistol Barrel", 12924) ],
    "Orichalcum Greatsword Blade" => [ Component.new("Orichalcum Greatsword Blade", 12840) ],
    "Orichalcum Greatsword Hilt" => [ Component.new("Orichalcum Greatsword Hilt", 12888 )],
    "Orichalcum Axe Blade" => [ Component.new("Orichalcum Axe Blade", 12852) ],
    "Orichalcum Shield Bacing" => [ Component.new("Orichalcum Shield Bacing", 12906) ],
    "Orichalcum Shield Boss" => [ Component.new("Orichalcum Shield Boss", 12912) ],
    "Orichalcum Hammer Head" => [ Component.new("Orichalcum Hammer Head", 12864) ],
    "Orichalcum Sword Blade" => [ Component.new("Orichalcum Sword Blade", 12870 )],
    "Orichalcum Sword Hilt" => [ Component.new("Orichalcum Sword Hilt", 12846 ) ],
    "Orichalcum Spear Head" => [ Component.new("Orichalcum Spear Head", 12998 ) ],
    "Orichalcum Plated Dowel" => [ Component.new("Orichalcum Plated Dowel", 12988) ],
    "Orichalcum Warhorn Mouthpiece" => [ Component.new("Orichalcum Warhorn Mouthpiece", 12930) ],

    "Ancient Staff Head" => [ Component.new("Ancient Staff Head", 13261) ],
    "Ancient Staff Shaft" =>  [ Component.new("Ancient Staff Shaft", 12973) ],
    "Ancient Pistol Frame" => [ Component.new("Ancient Pistol Frame", 12959) ],
    "Ancient Focus Casing" => [ Component.new("Ancient Focus Casing", 12982 ) ],
    "Ancient Focus Core" => [ Component.new("Ancient Focus Core", 13243 ) ],
    "Ancient Shortbow Stave" => [ Component.new("Ancient Shortbow Stave", 12947) ],
    "Ancient Longbow Stave" => [ Component.new("Ancient Longbow Stave", 12941) ],
    "Large Ancient Haft" => [ Component.new("Large Ancient Haft", 12899) ],
    "Small Ancient Haft" => [ Component.new("Small Ancient Haft", 12892) ],
    "Ancient Wood Plank" => [ Component.new("Ancient Wood Plank", 19712) ],

    "Glacial Lodestone" => [ Component.new("Glacial Lodestone", 24320)],
    "Onyx Lodestone" => [ Component.new("Onyx Lodestone", 24310)],
    "Charged Lodestone" => [ Component.new("Charged Lodestone", 24305)],
    "Molten Lodestone" => [ Component.new("Molten Lodestone", 24315)],
    "Crystal Lodestone" => [ Component.new("Crystal Lodestone", 24330)],
    "Destroyer Lodestone" => [ Component.new("Destroyer Lodestone", 24325)],
    "Corrupted Lodestone" => [ Component.new("Corrupted Lodestone", 24340)],

    "Pile Of Chrystaline Dust" => [ Component.new("Pile of Chrystaline Dust", 24277)],
    "Emerald Pendant" => [ Component.new("Emerald Pendant", 23096) ],
    "Ruby Pendant" => [ Component.new("Ruby Pendant", 23097) ],
    "Sapphire Pendant" => [ Component.new("Sapphire Pendant", 23098) ],
    "Emerald Orb" => [ Component.new("Emerald Orb", 24515) ],
    "Amber Pebble" => [ Component.new("Amber Pebble", 24534) ],

    "Lidless Eye" => [ Component.new("Lidless Eye", 31081) ],

    "Seasoned Wood Plank" => [ Component.new("Seasoned Wood Plank", 19714) ],

    "Pearl" => [ Component.new("Pearl", 24500) ],
    "Ruby Orb" => [ Component.new("Emerald Orb", 24508) ],
    "Sapphire Orb" => [ Component.new("Sapphire Orb", 24516) ],
    "Opal Orb" => [ Component.new("Opal Orb", 24510) ],
    "Coral Orb" => [ Component.new("Coral Orb", 24522 ) ],
    "Large Skull" => [ Component.new("Large Skull", 24366 ) ],

    "Orichalcum Ingot" => [ Component.new("Orichalcum Ingot", 19685) ],
    "Gold Ingot" => [ Component.new("Gold Ingot", 19682) ],
    "Vicious Claw" => [ Component.new("Vicious Claw", 24351) ],
    "Vicious Fang" => [ Component.new("Vicious Fang", 24357) ],

    "Vial Of Powerful Blood" => [ Component.new("Vial Of Powerful Blood", 24295) ],
    "Powerful Venom Sac" => [ Component.new("Powerful Venom Sac", 24283) ],
 

    "Ghost Pepper" => [ Component.new("Ghost Pepper", 12544) ],
    "Steel Ingot" => [ Component.new("Steel Ingot", 19688 ) ],
    "Bolt Of Gossamer" => [ Component.new("Bolt Of Gossamer", 19746) ],
    "Glob Of Ectoplasm" => [ Component.new("Glob Of Ectoplasm", 19721) ],
    "Mystic Coin" => [ Component.new("Mystic Coin", 19976) ],
    "Giant Eye" => [ Component.new("Giant Eye", 24370) ],
    "Ancient Bone" => [ Component.new("Ancient Bone", 24358)],
    "Bottle Of Elonian Wine" => [ Component.new("Bottle of Elonian Wine", 19633, 2630)],
    "Stein of Highlander Beer" => [ Component.new("Stein of Highlander Beer", 0, 16)],
    "Bag Of Jewels" => [ Component.new("Bag Of Jewels", 0, 1)],


    "SPCrystal"  => [ Component.new("Crystal", 0, 0.6)],
    "Siege Masters Guide"  => [ Component.new("Siege Masters Guide", 0, 1)],
    "Bloodstone Shard"  => [ Component.new("Bloodstone Shard", 0, 200)]
}

end

    def subget(name)
        comp = @cmp[name]

        if  comp == nil
            warn "** Nil Comp: " + name
            comp = GiftRecipe.new(name)
        end
        comp
    end

    def get(name, opts = {}) # pos also serves an an alias for tier
        position = opts[:position] || 1
        subsection  = opts[:subsection] || ""

        if subsection == ""
            comp = @cmp[name][position-1]
        else
            # NB: Recursive call
            comp = get(name)[subsection][position-1]
        end

        if comp.kind_of? String
            comp = subget(comp)
        elsif comp.kind_of? Array and comp[0].kind_of? String
            comp[0] = subget(comp[0])
        end
        comp
    end
end
