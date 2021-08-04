class Article < ApplicationRecord
  belongs_to :category
  has_many :comments
  has_many :users, through: :comments
  has_one_attached :image
end