# frozen_string_literal: true

class CreateReviewCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :review_categories do |t|
      t.integer :medium_id
      t.integer :feature_id
      t.integer :genre_id
      t.integer :review_id

      t.timestamps
    end
  end
end
