class Comment < ActiveRecord::Base
	belongs_to :item

	validates :body, presence: true#, length: { minimum: 5 }  
 	validates :score, presence: true, :numericality => { :greater_than_or_equal_to => 0, :less_than => 11}
 
	# after_initialize / after_find => calculate_average
	after_create do
		puts "entrei no after_create",
		item.calculate_average
		puts "Voltei ao after_create. Valor do average: #{item.average}"
	end

	after_destroy do
		item.calculate_average
	end

	after_update do
		item.calculate_average
	end

end
