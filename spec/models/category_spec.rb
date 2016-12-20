require 'rails_helper'

RSpec.describe Category, type: :model do

#	before(:each) do
#		@category = Category.create(name:"Category_Test")
#	end

	context "Category has_many Items" do
		it "should have many Items" do
			should have_many(:items)
		end
	end

	it{should have_many(:items)}

	it { should validate_uniqueness_of(:name)}
end
