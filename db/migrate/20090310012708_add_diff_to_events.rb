require 'htmldiff'

class AddDiffToEvents < ActiveRecord::Migration
  
  include HTMLDiff
  
  def self.up
    create_column :events, :diff, :string
    Event.each do |e|
      if e.changes.keys.include? 'body'
        e.diff = diff e.changes['body'].first, e.changes['body'].last
        e.save
      end
    end
  end

  def self.down
    remove_column :events, :diff
  end
end
