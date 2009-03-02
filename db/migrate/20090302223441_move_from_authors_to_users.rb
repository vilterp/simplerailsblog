class MoveFromAuthorsToUsers < ActiveRecord::Migration
  def self.up
    change_table :posts do |t|
      t.remove :author_id
      t.integer :user_id
    end
    change_table :comments do |t|
      t.remove :author_id
      t.integer :user_id
    end
  end

  def self.down
    change_table :posts do |t|
      t.remove :user_id
      t.integer :author_id
    end
    change_table :comments do |t|
      t.remove :user_id
      t.integer :author_id
    end
  end
end
