class AddArChangesToEvent < ActiveRecord::Migration
  def self.up
    add_column :events, :changes, :text
  end

  def self.down
    remove_column :events, :changes
  end
end
