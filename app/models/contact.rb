class Contact < ApplicationRecord

  validates :email, presence: true
  validates :name, presence: true
  validates :body, presence: true, length: { in: 1..200 }

  def self.looks(words) #管理者側検索機能
    @contact = Contact.where("name LIKE ?", "%#{words}%") #お問い合わせ時のお名前で部分検索
  end

end
