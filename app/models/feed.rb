require 'feed-normalizer'
require 'open-uri'

class Feed < ActiveRecord::Base

 
  has_many :items
  
  validates_presence_of :name, :url, :message => 'invalid, please enter a valid URL.'

  before_validation :set_name
  after_create :pull
  
  named_scope :sorted, :order => :name
  
  def set_name
    self.name = FeedNormalizer::FeedNormalizer.parse(open(self.url)).title rescue nil
  end
  
  def pull
    rss = FeedNormalizer::FeedNormalizer.parse(open(self.url))
    
    rss.items.each do |item|
      items.create(
        :title => item.title,
        :body => item.content,
        :published_at => item.date_published,
        :author => item.author
      )
    end
  end
  
  # Called using a cron job every 15-30 minutes
  #
  # Setup a cron job that run every day every 15 minutes this command
  # RAILS_APP_PATH/script/runner -e production "Feed.pull"
  def self.pull
    all.each {|feed| feed.pull }
  end
  
end