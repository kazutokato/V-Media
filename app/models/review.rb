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
    if search.empty?  #声質を選択しなかった場合
      Review.where("reviews.content_name LIKE(?) ", "%#{word}%") #番組名で部分一致検索
    elsif word.empty? #番組名を入力しなかった場合
      Review.includes(:feature).references(:feature).where("features.id IN (?)", search) #声質のみで絞り込み
    elsif [search, word].present? #声質を選択、番組名を入力した場合
      Review.includes(:feature).references(:feature).where("features.id IN (?) AND reviews.content_name LIKE (?) ", search, "%#{word}%" ) #両方の要素で絞り込み
    else  #何も選択せずに検索ボタンを押した場合
      @reviews = Review.all　#検索結果を全て表示
    end
  end

  def self.looks(words) #管理者用検索機能
    @review = Review.where("content_name LIKE ?", "%#{words}%") #番組名を部分検索
  end

end
