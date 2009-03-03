class AddSiteToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :site, :string
  end

  def self.down
    remove_column :users, :site
  end
end
