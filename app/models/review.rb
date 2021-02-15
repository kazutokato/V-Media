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

  def self.search_for(search,word) #エンドユーザー用検索機能
    if search.nil?
      Review.joins(:feature).where("reviews.content_name LIKE(?) ", "%#{word}%")
    elsif word.nil?
      Review.joins(:feature).where("features.id IN (?)", search)
    elsif [search, word].present?
      Review.joins(:feature).where("features.id IN (?) AND reviews.content_name LIKE (?) ", search, "%#{word}%" )
    else
      @reviews = Review.all
    end
  end

  def self.looks(words) #管理者用検索機能
    @review = Review.where("content_name LIKE ?", "%#{words}%") #番組名を部分検索
  end

end
