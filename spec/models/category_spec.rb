require 'rails_helper'

RSpec.describe Category, type: :model do

	before(:each) do
		@category = Category.create(name:"Category_Test")
	end

	context "has_many" do
		it "should have many Items" do
			should have_many(:items)
		end
		it{should have_many(:items)}
	end

	context "Valid Category" do
		it { should validate_uniqueness_of(:name)}
	end

	describe "Actions Tests" do
		context "create Category" do
			it "should have a created category after been created" do
				expect(Category.count).not_to eql(0)
			end
		end

		context "delete Category" do
			it "should be deleted after been deleted" do
				@category.destroy
				expect(Category.count).to eql(0)
			end
		end 
	end

end
