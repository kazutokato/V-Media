class Review < ApplicationRecord

  belongs_to :end_user
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :review_categories, dependent: :destroy

end
