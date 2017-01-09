class Comment < ActiveRecord::Base
	belongs_to :item

	validates :body, presence: true#, length: { minimum: 5 }  
 	validates :score, presence: true, :numericality => { :greater_than_or_equal_to => 0, :less_than_or_equal_to => 10}
	 	#, allow_nil:true
 
	# after_initialize / after_find => calculate_average
	after_create do
		item.calculate_average
	end

	after_destroy do
		item.calculate_average
	end

	after_update do
		item.calculate_average
	end

end
