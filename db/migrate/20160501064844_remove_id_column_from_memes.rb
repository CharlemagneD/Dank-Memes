class RemoveIdColumnFromMemes < ActiveRecord::Migration
  def change
    remove_column :memes, :user_id, :integer
  end
end
