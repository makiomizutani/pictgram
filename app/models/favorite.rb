class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :topic
  
  
  has_many :comments
end
