require 'spec_helper'

describe Component do
	context "without price" do
		before :each do
			@component = Component.new "name", 1001, nil
		end
		
		describe "#new" do	
			it "takes two parameters and returns a Component object" do
				@component.should be_an_instance_of Component
			end
		end
			
		describe "#name" do
			it "returns the correct name" do
				@component.name.should eql "name"
			end
		end

		describe "#id" do
			it "returns the correct id" do
				@component.id.should eql 1001
			end
		end

		describe "#price" do
			it "returns a price object" do
        		@component.price.should_not be_an_instance_of Price
			end
		end
	end


	context "with Gold Price" do
		before :each do
			goldPrice = GoldPrice.new 2000
			@component = Component.new "newname", 1001, goldPrice 
		end
		
		describe "#new" do	
			it "takes three parameters and returns a Component object" do
				@component.should be_an_instance_of Component
			end
		end
			
		describe "#price" do
			it "returns a GoldPrice object" do
        		@component.price.should be_an_instance_of GoldPrice
			end
		end

		describe "#price#value" do
			it "returns the correct value for price - NOTE will fail until mocked " do
				@component.price.value.should eql 2000
			end
		end
	end

	context "with Skill Point Price" do
		before :each do
			sp_price = SkillPointPrice.new 400
			@component = Component.new "name", 3000, sp_price
		end
		
		describe "#new" do	
			it "takes two parameters and returns a Component object" do
				@component.should be_an_instance_of Component
			end
		end
			
		describe "#price" do
			it "returns a price object" do
        		@component.price.should be_an_instance_of SkillPointPrice
			end
		end

		describe "#price#value" do
			it "returns the correct value for price 3000 " do
				@component.price.value.should eql 400 
			end
		end
	end
end

describe MFRComponent do
	context "With id=0 (skill point based price) " do
		before :each do
			@component = MFRComponent.new "name", 0, 5
		end
		describe "#new" do	
			it "takes three parameters and returns a MFRComponent object" do
				@component.should be_an_instance_of MFRComponent
			end
		end
	end

	context "With id > 0 (gold based price)" do
		before :each do
			@component = MFRComponent.new "name", 23491, 1
		end
		describe "#new" do	
			it "takes three parameters and returns a MFRComponent object" do
				@component.should be_an_instance_of MFRComponent
			end
		end
	end
end
