class Category < ActiveRecord::Base
has_many :items, :dependent => :destroy # Sem este :dependent é impossível excluir categorias com itens

end
