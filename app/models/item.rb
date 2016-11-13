class Item < ActiveRecord::Base
	has_many :comments, :dependent => :destroy # Sem este :dependent é impossível excluir itens com comentários
	belongs_to :category

	validates :category, presence: true
	validates :institution, presence: true
	#validates :average, :numericality => { :greater_than_or_equal_to => 0, :less_than => 11} #, presence: true


	def calculate_average
		puts "Entrei no método calculate_average dentro de Item. "

		# criar array de notas (scores) e variável media (* Se 11, não aparecer)
		array_scores = Array.new
		media = 11
		somatorio = 0

		# percorrer todos comentários e armazenar num array de inteiros
		self.comments.each do |c|
			array_scores.push(c.score)
		end

		puts "Array: #{array_scores}"

		# Somar os elementos através do Inject. Seria a mesma coisa que: array_scores.each do |value| somatorio += value end
		somatorio = array_scores.inject(:+)

		puts "Somatório dos elementos: #{somatorio}"

		if array_scores.length < 1
			# media continua sendo 11. 
		else
			media = somatorio / array_scores.length
			puts "Média: #{media}"
		end

		# inserir a média no atributo average
		self.average = media
		self.save
	end

end
