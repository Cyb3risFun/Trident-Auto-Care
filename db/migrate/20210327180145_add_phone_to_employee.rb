class AddPhoneToEmployee < ActiveRecord::Migration[6.1]
  def change
    add_column :employees, :phone, :string
  end
end
