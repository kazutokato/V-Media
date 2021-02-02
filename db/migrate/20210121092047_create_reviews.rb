class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.integer :end_user_id
      t.integer :medium_id
      t.integer :feature_id
      t.integer :genre_id
      t.string :content_name
      t.string :cast
      t.string :gender
      t.float :rate
      t.text :body
      t.timestamps
    end
  end
end
