require 'spec_helper'

describe Price do
	before :each do
    		@price = Price.new "name", 1
	end
	
	describe "#new" do
    		it "takes two parameters and returns a Price object" do
        		@price.should be_an_instance_of Price
		end
    	end
	
	describe "#name" do
    		it "returns the correct name, which describes the type of price it is for" do
        		@price.name.should eql "name"
		end
    	end

	describe "#value" do
    		it "returns the correct quantity, which is the value of the price " do
        		@price.value.should eql 1
		end
    	end
end

describe GoldPrice do
	before :each do
    		@price = GoldPrice.new 100
	end
	
	describe "#new" do
    		it "takes one parameter and returns a GoldPrice object" do
        		@price.should be_an_instance_of GoldPrice
		end
    	end
	
	describe "#name" do
    		it "returns the correct name, which describes the type of price it is for" do
        		@price.name.should eql "Gold"
		end
    	end

	describe "#value" do
    		it "returns the correct quantity, which is the value of the price " do
        		@price.value.should eql 100
		end
	end
end

describe SkillPointPrice do
	before :each do
    		@price = SkillPointPrice.new  200
	end
	
	describe "#new" do
    		it "takes one parameter and returns a SkillPrice object" do
        		@price.should be_an_instance_of SkillPointPrice
		end
    	end
	
	describe "#name" do
    		it "returns the correct name, which describes the type of price it is for" do
        		@price.name.should eql "Skill Point"
		end
    	end

	describe "#value" do
    		it "returns the correct quantity, which is the value of the price " do
        		@price.value.should eql 200
		end
	end
end
