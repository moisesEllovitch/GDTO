require 'rails_helper'

RSpec.describe Comment, type: :model do

	it {should validate_numericality_of(:score).is_less_than_or_equal_to(10).
		is_greater_than_or_equal_to(0)}

	it {should belong_to(:item)}
end
