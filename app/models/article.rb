class Article < ApplicationRecord
  PAGINATION_ITEMS = 10

  belongs_to :category
  has_many :comments
  has_many :users, through: :comments
  has_one_attached :image
end