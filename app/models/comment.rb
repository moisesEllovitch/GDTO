class Comment < ActiveRecord::Base
  belongs_to :item

  validates :body, presence: true, length: { minimum: 5 }  
  validates :score, presence: true
  
end
