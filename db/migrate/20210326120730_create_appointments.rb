class CreateAppointments < ActiveRecord::Migration[6.1]
  def change
    create_table :appointments do |t|
      t.string :service
      t.string :time
      t.string :vehicle_vin
      t.string :vehicle_name
      t.string :vehicle_manufacture
      t.string :vehicle_type
      t.integer :vehicle_year
      t.string :vehicle_license_plate_num
      t.float :price, default: 0.0
      t.string :status, default: "Pending"


      t.timestamps
    end
  end
end
