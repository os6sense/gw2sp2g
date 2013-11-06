# == component
#
#
#
require_relative 'price'

class Component 
 	attr_accessor :name, :id, :price
        def initialize name, id, spprice=0
	    if id == 0 
	   	@price = SkillPointPrice.new spprice
	    else 
		@price = GoldPrice.new id
	    end
	    @id = id
            @name = name
	end	
end

class MFRComponent 
 	attr_accessor :component, :quantity
        def initialize component, quantity
	    @component = component
	    @quantity = quantity
	end
end

class Result 
 	attr_accessor :component, :low_quantity, :high_quantity
        def initialize component, low_quantity, high_quantity
	    @component = component
	    @low_quantity = low_quantity
	    @high_quantity = high_quantity
	end
end
