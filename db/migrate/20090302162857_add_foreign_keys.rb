class AddForeignKeys < ActiveRecord::Migration
  def self.up
    change_table :comments do |t|
      t.integer :post_id
      t.integer :author_id
    end
    change_table :posts do |t|
      t.integer :author_id
    end
  end

  def self.down
    change_table :comments do |t|
      t.remove :post_id
      t.remove :author_id
    end
    change_table :posts do |t|
      t.remove :author_id
    end
  end
end
