require_relative 'price'

# == Component
# Components are the building blocks of recipes

class Component 
	# mix in the GW2Spidy module to allow us to look up a price by id
	include GW2Spidy

	# name:: blah name
	# :id blah id
	# price: blay price
	# img:: blah image
	attr_accessor :name, :id, :price, :img

	# Create a new Component
	# name::  Human readable identifyier to aid in identifying the component
	# id:: The GW2Spidy identifier (numeric e.g. 13928) for the Component
	# spprice - Skill Point Price, the cost of the Component in Skill points rather than gold
	# Only supply this if the price is in skill points rather than in gold
        def initialize name, id, spprice=0
	    if id == 0
		@price = SkillPointPrice.new spprice
		@img = ''
	    else
		@price = GoldPrice.new id
		@img = self.getByID(id)['img']
	    end
	    @id = id
            @name = name
	end
end

#class MFRComponent
#	attr_accessor :component, :quantity
#        def initialize component, quantity
#	    @component = component
#	    @quantity = quantity
#	end
#end

