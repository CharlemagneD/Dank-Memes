class AddAdminToDankUsers < ActiveRecord::Migration
  def change
    add_column :dank_users, :admin, :boolean, default: false
  end
end
