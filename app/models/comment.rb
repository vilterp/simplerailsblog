class Comment < ActiveRecord::Base
  belongs_to :post, :author
  
  validates_presence_of :body
end
