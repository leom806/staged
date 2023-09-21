class CreateServices < ActiveRecord::Migration[7.0]
  def change
    create_table :services do |t|
      t.integer :company_id, null: false
      t.integer :customer_id, null: false
      t.integer :car_id, null: false

      t.string :name, null: false
      t.text :description
      t.integer :status, default: 0, null: false

      t.timestamps
    end
  end
end
