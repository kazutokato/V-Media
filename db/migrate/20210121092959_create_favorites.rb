class CreateFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :favorites do |t|
      t.integer :end_user_id
      t.integer :review_id

      t.timestamps
    end
  end
end