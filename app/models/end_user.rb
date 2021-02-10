class EndUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :reviews, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  attachment :profile_image

  validates :last_name, presence: true, length: { maximum: 10 }
  validates :first_name, presence: true, length: { maximum: 10 }
  validates :prefecture, presence: true, length: { maximum: 4 }
  validates :age, presence: true, numericality: {only_integer: true}
  validates :nickname, presence: true, uniqueness: true, length: { maximum: 8 }
  validates :introduction, length: { maximum: 60 }

  enum is_active: {Available: true, Invalid: false} #有効会員はtrue、退会済み会員はfalse

  def active_for_authentication?
    super && (self.is_active === "Available") #is_activeが有効の場合は有効会員(ログイン可能)
  end

end
