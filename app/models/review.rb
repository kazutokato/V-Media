class Review < ApplicationRecord

  belongs_to :end_user
  belongs_to :medium
  belongs_to :feature
  belongs_to :genre
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :review_categories, dependent: :destroy

  validates :content_name, presence: true
  validates :cast, presence: true
  validates :gender, presence: true
  validates :body, presence: true, length: { maximum: 160 }

  def favorited_by?(end_user) #いいね機能
    favorites.where(end_user_id: end_user.id).exists?
  end
  
  def self.search(search)
    if search
      Review.where("content_name LIKE ?", "%#{search}%")
    else
      Review.all
    end
  end  

  def self.search(search) #検索機能
    if search
      Review.where("content_name LIKE ?", "%#{search}%") #番組名を部分検索
    else
      Review.all
    end
  end

end
