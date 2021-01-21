class Review < ApplicationRecord

  belongs_to :end_user
  belongs_to :category
  has_many :comments, dependent: :destroy
  has_many :rates, dependent: :destroy
  has_many :favorites, dependent: :destroy

end
