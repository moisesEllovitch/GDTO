class Item < ActiveRecord::Base
	has_many :comments

	validates :category, presence: true
	validates :institution, presence: true
	validates :average, presence: true

end
