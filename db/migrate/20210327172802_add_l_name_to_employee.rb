class AddLNameToEmployee < ActiveRecord::Migration[6.1]
  def change
    add_column :employees, :Last_name, :string
  end
end
