class Post < ActiveRecord::Base  
  belongs_to :user
  has_many :comments
  
  validates_presence_of :title, :body
  validates_uniqueness_of :title
  
  has_permalink :title
  
  def to_param
    permalink
  end
end
