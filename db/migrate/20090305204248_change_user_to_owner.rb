class ChangeUserToOwner < ActiveRecord::Migration
  def self.up
    rename_column :posts, :user_id, :owner_id
  end

  def self.down
    rename_column :posts, :owner_id, :user_id
  end
end
