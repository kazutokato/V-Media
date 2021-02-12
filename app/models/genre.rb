# frozen_string_literal: true

class Genre < ApplicationRecord
  has_many :review_categories, dependent: :destroy
end
