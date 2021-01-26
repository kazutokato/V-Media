class Genre < ApplicationRecord
  has_many :review_categories, dependent: :destroy
end
