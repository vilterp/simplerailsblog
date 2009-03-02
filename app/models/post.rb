class Post < ActiveRecord::Base  
  belongs_to :author
  has_many :comments
  
  validates_presence_of :title, :body
  validates_uniqueness_of :title
end
