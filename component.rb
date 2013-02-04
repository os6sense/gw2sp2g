require_relative 'price'

# == Component
# Components are the building blocks of recipes

class Component
        # mix in the GW2Spidy module to allow us to look up a price by id
        include GW2Spidy

	# name:: blah name
	# img:: blah image
	attr_accessor :name, :id, :price, :img

	# Create a new Component
	# name::  Human readable identifyier to aid in identifying the component
	# id:: The GW2Spidy identifier (numeric e.g. 13928) for the Component
	# price:: - The cost of the Component. If id is 0 the the price is taken to 
        # be in Skill points rather than gold
        def initialize name, id, price=0
	    @id = id
            @name = name

            # code smell - factory please?
	    if id == 0
		@price = SkillPointPrice.new(price)
                setImg
	    else
		@price = GoldPrice.new(id, price)
		@img = getByID(id)['img']
	    end
            puts "Init: " + name
	end

        def setImg
            # There are only currently 4 types of skill point
            if @name == "Crystals" or @name == "Crystal"
                @img = "http://wiki.guildwars2.com/images/3/31/Crystal.png"
            elsif @name ==  "Philosopher's Stone"
                @img = "http://wiki.guildwars2.com/images/b/b9/Philosopher%27s_Stone.png"
            elsif @name ==  "Eldritch Scroll"
                @img = "http://wiki.guildwars2.com/images/5/53/Eldritch_Scroll.png"
            elsif @name ==  "Bloodstone Shard"
                @img = "http://wiki.guildwars2.com/images/archive/e/e7/20130101023416!Bloodstone_Shard.png"
            end

        end
end


