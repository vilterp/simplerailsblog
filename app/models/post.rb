class Post < ActiveRecord::Base  
  belongs_to :owner, :class_name => 'User'
  has_many :comments
  has_many :edits, :class_name => 'Event', :foreign_key => "item_id",
           :conditions => { :item_class => 'Post', :action => 'update' }
  
  validates_presence_of :title, :body
  validates_uniqueness_of :title
  
  has_permalink :title
  
  def to_param
    permalink
  end
  
  def comments_and_edits
    (self.comments + self.edits).sort! do |x,y|
      x.created_at <=> y.created_at
    end
  end
  
  # TODO: wrap these in an include
  
  def save_with_user(theuser)
    e = Event.new :user => theuser, :changes => self.changes,
                  :action => (new_record? ? 'create' : 'update')
    result = save
    e.item = self
    e.save
    result
  end
  
  def destroy_with_user(theuser)
    # TODO: save the title somehow
    Event.create :user => theuser, :changes => self.changes, :item => self, :action => 'destroy'
    destroy
  end
  
end
