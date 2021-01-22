class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.integer :end_user_id
      t.integer :review_id
      t.text :body

      t.timestamps
    end
  end
end
