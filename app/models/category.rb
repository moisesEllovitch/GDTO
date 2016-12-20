class Category < ActiveRecord::Base

	validates_uniqueness_of :name

	has_many :items, :dependent => :destroy # It must be there to may possible to destroy a Category even with comments
end
