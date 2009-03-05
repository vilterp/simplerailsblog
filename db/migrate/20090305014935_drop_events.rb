class DropEvents < ActiveRecord::Migration
  def self.up
    drop_table :events
  end

  def self.down
    create_table 'events' do |t|
      t.integer :user_id
      t.string :item_type
      t.integer :item_id
      t.string :action
    end
  end
end
