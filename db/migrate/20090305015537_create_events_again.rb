class CreateEventsAgain < ActiveRecord::Migration
  def self.up
    create_table :events do |t|
      t.integer :user_id
      t.string :action # create, read, update, or delete
      t.datetime :created_at
    end
  end

  def self.down
    drop_table :events
  end
end
