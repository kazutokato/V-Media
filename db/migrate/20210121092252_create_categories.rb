class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.string :medium
      t.string :feature
      t.string :speed
      t.string :gender

      t.timestamps
    end
  end
end
