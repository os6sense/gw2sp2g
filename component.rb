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
		@img = ''
	    else
		@price = GoldPrice.new(id, price)
		@img = self.getByID(id)['img']
	    end
	end
end

#class MFRComponent
#	attr_accessor :component, :quantity
#        def initialize component, quantity
#	    @component = component
#	    @quantity = quantity
#	end
#end

