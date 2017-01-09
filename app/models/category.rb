class Category < ActiveRecord::Base

	validates :name, presence: true, uniqueness: true

	has_many :items, :dependent => :destroy # It must be there to may possible to destroy a Category even with comments
end
