class Comment < ActiveRecord::Base
  belongs_to :item

  validates :body, presence: true; lengt: {minimum: 5}
  validates :score, presence: true;
  
end
