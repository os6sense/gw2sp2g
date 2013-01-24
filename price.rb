require_relative 'gw2spidy'

class Price
	attr_accessor :name, :value
        def initialize (name, val=0)
            @name = name
            @value = val
        end
end

class SkillPointPrice < Price
	attr_accessor :sale, :offer
        def initialize (val=0)
		super("Skill Point", val)
		@sale = @offer = val
	end
end

class GoldPrice < Price
	include GW2Spidy
	attr_accessor :sale, :offer
        def initialize (id, val=0, o_val=0)
		super("Gold", val)
		@o_val = o_val
		self.getPrice id
	end

	def getPrice id
		if id == 0
			@value == 0 ? @sale = @offer = 0 : (@sale,@offer=@value,@o_val)
		else
			data = self.getByID(id)
                        if @value == 0
			    @sale = data["min_sale_unit_price"]
			    @offer = data["max_offer_unit_price"]
                        else
                            @sale = @value
                            @offer = @value
                        end
		end
	end

	def self.to_g val
		r = ""
		if val < 0
			#val=val.abs
			#r="-"
                        return '0c'
		end

		s_tmp = val.round.to_s
		s = s_tmp.size

		if s > 4 then
			r += s_tmp[0, s-4] + 'g '
			s_tmp=s_tmp[s-4, 4 ]
			s = s_tmp.size
		end

		if s > 2 then
			r += s_tmp[0, s-2] + 's '
			s_tmp=s_tmp[s-2, 2]
			s = s_tmp.size 
		end

		r += s_tmp + 'c'
		r
	end
end
