# update prices form gw2 Spidy as a seperate process
#
require_relative 'mf_recipe_components'
require_relative 'gw2spidy'

class Component
    def getByID(id)
        setByID(id)
    end
end
#class Price
#    def getByID(id)
 #       setByID(id)
#    end
#end

mfrc = MFRecipeComponents.new

def checkCompArray x
    if x.kind_of? Array
        checkCompArray x
    else
        p x
    end

end

mfrc.each do |x|
    checkCompArray x
end

