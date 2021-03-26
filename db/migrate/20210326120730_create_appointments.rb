class CreateAppointments < ActiveRecord::Migration[6.1]
  def change
    create_table :appointments do |t|
      t.string :service
      t.string :time
      t.float :price
      t.string :status, default: "Waiting for confirm"

      t.timestamps
    end
  end
end
