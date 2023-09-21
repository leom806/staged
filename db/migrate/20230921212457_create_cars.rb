class CreateCars < ActiveRecord::Migration[7.0]
  def change
    create_table :cars do |t|
      t.integer :user_id, null: false, index: true

      t.string :brand, null: false
      t.string :model, null: false
      t.string :version
      t.string :type
      t.string :plate, null: false
      t.integer :mileage, null: false
      t.integer :year_make
      t.integer :year_model
      t.string :color, null: false

      t.timestamps
    end
  end
end
