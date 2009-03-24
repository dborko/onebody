class Item < ActiveRecord::Base
 
  belongs_to :feed
  
  validates_presence_of :title, :body, :published_at, :feed
  validates_uniqueness_of :title, :scope => [:body, :author, :feed_id]



end
