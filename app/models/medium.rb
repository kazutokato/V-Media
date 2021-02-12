# frozen_string_literal: true

class Medium < ApplicationRecord
  has_many :review_categories, dependent: :destroy
end
