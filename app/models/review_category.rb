class ReviewCategory < ApplicationRecord
  belongs_to :medium
  belongs_to :feature
  belongs_to :genre
  belongs_to :review
end
