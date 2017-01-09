require 'rails_helper'

RSpec.describe Comment, type: :model do

	before(:each) do
		@category = Category.create(name:"cat")
		@item = Item.create(institution: "inst", average: nil, category_id:@category.id)		
		@comment = Comment.create(body: "comm", score: 1, item_id:@item.id)
	end

	context "belongs to" do
		it {should belong_to(:item)}
	end

	context "Valid Comment" do
		it {should validate_numericality_of(:score).is_less_than_or_equal_to(10).
			is_greater_than_or_equal_to(0)}
	end

	describe "Actions Tests" do
		context "create Comment" do
			it "should have a created comment after been created" do
				expect(Comment.count).not_to eql(0)
			end
		end

		context "delete Commen" do
			it "should be deleted after been deleted" do
				@comment.destroy
				expect(Comment.count).to eql(0)
			end
		end 	
	end
end
