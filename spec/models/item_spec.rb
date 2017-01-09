require 'rails_helper'

RSpec.describe Item, type: :model do

	before(:each) do
		@category = Category.create(name:"cat_test")
		@item = Item.create(institution: "inst", average: nil, category_id:@category.id)
	end

	# Refazer. Fiz no começo de qqer jeito
	context "calculate_average" do
		it "should return nil" do
			expect(@item.calculate_average).to be_nil
		end

		it "should calculate the average" do
			@comment1 = Comment.create(body: "comm", score: 1, item_id:@item.id)
			@comment2 = Comment.create(body: "comm", score: 3, item_id:@item.id)
			expect(@item.calculate_average).to eql((@comment1.score+@comment2.score)/2)
		end

		it "should not be bigger than 10 or less than 0" do			

		end
	end

	context "Valid Item" do
		# Se eu coloco no metodo de calcular a media um valor maior que 10, ele não reclama, mas deveria!! 
		it {should validate_numericality_of(:average).is_less_than_or_equal_to(10).is_greater_than_or_equal_to(0)}
	end

	context "have_many & belong_to" do
		it {should have_many(:comments)}	
		it {should belong_to(:category)}
	end

	describe "Actions Tests" do
		context "create Item" do
			it "should have a created Item after been created" do
				expect(Item.count).not_to eql(0)
			end
		end

		context "delete Item" do
			it "should be deleted after been deleted" do
				@item.destroy
				expect(Item.count).to eql(0)
			end
		end 
	end
end
