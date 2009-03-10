class AddItemInfoToEventsAgain < ActiveRecord::Migration
  def self.up
    add_column :events, :item_id, :integer
    add_column :events, :item_class, :string
  end

  def self.down
    remove_column :events, :item_id
    remove_column :events, :item_class
  end
end
