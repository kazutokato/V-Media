class Review < ApplicationRecord

  belongs_to :end_user
  belongs_to :medium
  belongs_to :feature
  belongs_to :genre
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :review_categories, dependent: :destroy

  def favorited_by?(end_user)
    favorites.where(end_user_id: end_user.id).exists?
  end

end
