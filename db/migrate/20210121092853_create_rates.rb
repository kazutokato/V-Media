class CreateRates < ActiveRecord::Migration[5.2]
  def change
    create_table :rates do |t|
      t.integer :end_user_id
      t.integer :review_id
      t.float :rate

      t.timestamps
    end
  end
end
