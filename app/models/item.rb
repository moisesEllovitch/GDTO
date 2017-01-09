class Item < ActiveRecord::Base
	has_many :comments, :dependent => :destroy # Sem este :dependent é impossível excluir itens com comentários
	belongs_to :category

	validates :category, presence: true
	validates :institution, presence: true
	validates :average, :numericality => { :greater_than_or_equal_to => 0, :less_than_or_equal_to => 10}, allow_nil:true

	def calculate_average 
		# create an array of v_scores, variable v_average and the v_sum.
		v_scores = Array.new
		v_average = nil
		v_sum = 0

		# Go through comments and store them at the array
		self.comments.each do |c|
			v_scores.push(c.score)
		end

		puts "Array: #{v_scores}"

		# Sum the elements by Inject. It's the same of: v_scores.each do |value| v_sum += value
		v_sum = v_scores.inject(:+)

		puts "Sum of the elements: #{v_sum}"

		if v_scores.length < 1
			# v_average keep been nil
		else
			v_average = v_sum / v_scores.length
			puts "Average: #{v_average}"
		end

		# Save the average on the Itemself
		self.average = v_average
		self.save

		return self.average
	end

end
