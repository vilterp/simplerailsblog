class AddChangeDataToEvent < ActiveRecord::Migration
  def self.up
    change_table :events do |t|
      # for linking to item
      t.integer :item_id
      t.integer :item_class
      # actual change
      t.string :field
      t.string :type
      t.string :oldvalue
      t.string :newvalue
      
      # the app should be able to figure out what happened from user, field, item, old_value, and new_value
    end
  end

  def self.down
    change_table :events do |t|
      t.remove :item_id, :item_class, :field, :type, :oldvalue, :newvalue
    end
  end
end
