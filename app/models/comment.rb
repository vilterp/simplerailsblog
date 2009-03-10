class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user
  
  validates_presence_of :body
  
  def save_with_user(theuser)
    self.user = theuser
    e = Event.new :user => theuser, :changes => self.changes,
                  :action => (new_record? ? 'create' : 'update')
    result = save
    e.item = self
    e.save
    result
  end
  
  def destroy_with_user(theuser)
    # save the title somehow
    self.user = theuser
    Event.create :user => theuser, :changes => self.changes, :item => self, :action => 'destroy'
    destroy
  end
  
end
