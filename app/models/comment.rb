class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :author
  
  validates_presence_of :body
end
