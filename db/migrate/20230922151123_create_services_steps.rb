class CreateServicesSteps < ActiveRecord::Migration[7.0]
  def change
    create_table :services_steps do |t|
      t.integer :service_id, null: false
      t.string :name, null: false
      t.string :description
      t.integer :status, null: false, default: 0

      t.timestamps
    end
  end
end
