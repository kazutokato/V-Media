# frozen_string_literal: true

class Feature < ApplicationRecord
  has_many :review_categories, dependent: :destroy
end
