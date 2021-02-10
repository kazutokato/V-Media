class Contact < ApplicationRecord

  validates :email, presence: true
  validates :name, presence: true
  validates :body, presence: true, length: { in: 1..200 }

end
