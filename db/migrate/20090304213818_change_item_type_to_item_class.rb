class ChangeItemTypeToItemClass < ActiveRecord::Migration
  def self.up
    rename_column :events, :item_type, :item_class
  end

  def self.down
    rename_column :events, :item_class, :item_type
  end
end
