class AddFNameToEmployee < ActiveRecord::Migration[6.1]
  def change
    add_column :employees, :First_name, :string
  end
end
