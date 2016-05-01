class AddUserIdToMemes < ActiveRecord::Migration
  def change
    add_column :memes, :dank_user_id, :integer
  end
end
