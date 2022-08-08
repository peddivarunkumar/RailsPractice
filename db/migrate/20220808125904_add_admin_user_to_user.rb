class AddAdminUserToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :admin_user, :boolean
  end
end
