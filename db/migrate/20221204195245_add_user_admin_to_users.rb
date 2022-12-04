class AddUserAdminToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :user_admin, :boolean, default: false
  end
end
