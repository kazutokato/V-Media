class Comment < ApplicationRecord

  belongs_to :end_user
  belongs_to :review

  validates :body, presence: true, length: { maximum: 40 }

end
