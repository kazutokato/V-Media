class Review < ApplicationRecord

  belongs_to :end_user
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :review_categories, dependent: :destroy
  attr_accessor :medium_id

  def favorited_by?(end_user)
    favorites.where(end_user_id: end_user.id).exists?
  end

end
