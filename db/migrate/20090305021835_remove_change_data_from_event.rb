class RemoveChangeDataFromEvent < ActiveRecord::Migration
  def self.up
    change_table :events do |t|
      t.remove :item_id, :item_class, :field, :type, :oldvalue, :newvalue
    end
  end

  def self.down
    # for linking to item
    t.integer :item_id
    t.integer :item_class
    # actual change
    t.string :field
    t.string :type
    t.string :oldvalue
    t.string :newvalue
  end
end
