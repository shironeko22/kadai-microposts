class Micropost < ApplicationRecord
  belongs_to :user
  
  validates :content, presence: true, length: { maximum: 255 }
  
  has_many :favorites
  has_many :favorite_froms, through: :favorites, source: :user
  has_many :reverses_of_favorite, class_name: "Favorite", foreign_key: "micropost_id"
  has_many :favorite_tos, through: :reverses_of_favorite, source: :micropost
end
