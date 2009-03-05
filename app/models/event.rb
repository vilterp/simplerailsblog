class Event < ActiveRecord::Base
  
  belongs_to :user
  
  serialize :changes
  
  def item
    @item ||= eval(self[:item_class]).find_by_id(self[:item_id])
  end
  
  def item=(item)
    self[:item_id] = item.id
    self[:item_class] = item.class.to_s
  end
  
end
