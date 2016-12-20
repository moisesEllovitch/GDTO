require 'rails_helper'

RSpec.describe Item, type: :model do

	# Refazer. Fiz no começo de qqer jeito
#	context "Average method return values between 0 and 10" do
#		it "should not be bigger than 10 or less than 0" do
#			average1 = 3
#			expect(average1).to be >= 0
#			expect(average1).to be <= 10
#		end
#	end

	# Se eu coloco no metodo de calcular a media um valor maior que 10, ele não reclama, mas deveria!! 
	it {should validate_numericality_of(:average).is_less_than_or_equal_to(10).is_greater_than_or_equal_to(0)}

	it {should have_many(:comments)}	
	it {should belong_to(:category)}
end
