class CreateEvents < ActiveRecord::Migration
  def self.up
    create_table 'events' do |t|
      t.integer :user_id
      t.string :item_type
      t.integer :item_id
      t.string :action
    end
  end
  
  def self.down
    drop_table :events
  end
end