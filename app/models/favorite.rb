# frozen_string_literal: true

class Favorite < ApplicationRecord
  belongs_to :end_user
  belongs_to :review
end
