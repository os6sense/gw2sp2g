# update prices form gw2 Spidy as a seperate process
#
require_relative 'mf_recipe_components'
require_relative 'gw2spidy'

require 'logger'

class Component
    def getByID(id)
        setByID(id)
    end
end

def checkCompArray x
    if x.kind_of? Array
        checkCompArray x
    else
        p x
    end

end

logger = Logger.new('/var/log/gw2sp2g/updatePrices.log')

logger.debug("Starting")
begin
mfrc = MFRecipeComponents.new
#    mfrc.each do |x|
#        checkCompArray x
#    end
rescue
    logger.debug({})
end
logger.debug("COmplete")
