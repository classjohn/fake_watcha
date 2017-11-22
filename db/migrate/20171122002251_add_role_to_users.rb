class AddRoleToUsers < ActiveRecord::Migration
  def change
    add_column :users, :role, :string, :default => "regular", :null => false
  end
end
