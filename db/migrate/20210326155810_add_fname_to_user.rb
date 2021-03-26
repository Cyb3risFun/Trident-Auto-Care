class AddFnameToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :First_name, :string
  end
end
