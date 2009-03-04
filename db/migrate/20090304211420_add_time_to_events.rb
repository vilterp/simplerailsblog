class AddTimeToEvents < ActiveRecord::Migration
  def self.up
    add_column :events, :created_at, :datetime
  end

  def self.down
    remove_column :events, :created_at
  end
end
