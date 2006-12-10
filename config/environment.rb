# Be sure to restart your web server when you modify this file.

# Uncomment below to force Rails into production mode when 
# you don't control web/app server and can't set it the proper way
# ENV['RAILS_ENV'] ||= 'production'

# Specifies gem version of Rails to use when vendor/rails is not present
RAILS_GEM_VERSION = '1.1.6'

# Bootstrap the Rails environment, frameworks, and default configuration
require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|
  # Settings in config/environments/* take precedence those specified here
  
  # Skip frameworks you're not going to use (only works if using vendor/rails)
  # config.frameworks -= [ :action_web_service, :action_mailer ]

  # Add additional load paths for your own custom dirs
  # config.load_paths += %W( #{RAILS_ROOT}/extras )

  # Force all environments to use the same logger level 
  # (by default production uses :info, the others :debug)
  # config.log_level = :debug

  # Use the database for sessions instead of the file system
  # (create the session table with 'rake db:sessions:create')
  config.action_controller.session_store = :active_record_store

  # Use SQL instead of Active Record's schema dumper when creating the test database.
  # This is necessary if your schema can't be completely dumped by the schema dumper, 
  # like if you have constraints or database-specific column types
  # config.active_record.schema_format = :sql

  # Activate observers that should always be running
  # config.active_record.observers = :cacher, :garbage_collector

  # Make Active Record use UTC-base instead of local time
  # config.active_record.default_timezone = :utc
  
  # See Rails::Configuration for more options
end

# Add new inflection rules using the following format 
# (all these examples are active by default):
# Inflector.inflections do |inflect|
#   inflect.plural /^(ox)$/i, '\1en'
#   inflect.singular /^(ox)en/i, '\1'
#   inflect.irregular 'person', 'people'
#   inflect.uncountable %w( fish sheep )
# end

# Include your application configuration below

require 'rubygems'
require 'RMagick'
require 'pdf/writer'
require 'open-uri'
require 'rexml/document'
require 'inherited_attribute'
require 'add_condition'
require 'ar_date_fix'

ActionMailer::Base.server_settings = {
  :address  => 'localhost',
  :port  => 25,
  :domain => 'cedar.ridge.cc',
}

YAHOO_APP_ID = 'cedar_ridge_christian_church'

CHURCH_NAME = 'Cedar Ridge Christian Church'
CHURCH_OFFICE_PHONE = '(918) 254-0621'
SITE_TITLE = 'Cedar Ridge Family'
SITE_SIMPLE_URL = 'cedar.ridge.cc'
SITE_URL = "http://#{SITE_SIMPLE_URL}/"
VISITOR_SIMPLE_URL = 'cedarridgecc.com'
VISITOR_URL = "http://#{VISITOR_SIMPLE_URL}"
MONTHS = [
  ['January',  1],
  ['February',  2],
  ['March',  3],
  ['April',  4],
  ['May',  5],
  ['June',  6],
  ['July',  7],
  ['August',  8],
  ['September',  9],
  ['October',  10],
  ['November',  11],
  ['December',  12],
]
PHOTO_SIZES = {
  :tn => '32x32',
  :small => '75x75',
  :medium => '150x150',
  :large => '400x400'
}
SEND_UPDATES_TO = 'seven1m@gmail.com'
BIRTHDAY_VERIFICATION_EMAIL = 'seven1m@gmail.com'
SYSTEM_NOREPLY_EMAIL = 'no-reply@cedar.ridge.cc'
GROUP_ADDRESS_DOMAIN = 'crccministries.com'
ADMIN_CHECK = Proc.new do |person|
  person.email =~ /@cedarridgecc.com$/ or person.classes.split(',').include?('EL') or person.email =~ /^tim@timmorgan/
end
MAX_DAILY_VERIFICATION_ATTEMPTS = 3
MOBILE_GATEWAYS = {
  'AT&T' => '%s@mobile.att.net',
  'CellularOne' => '%s@mobile.celloneusa.com',
  'Cingular' => '%s@mobile.mycingular.com',
  'Nextel' => '%s@messaging.nextel.com',
  'Sprint' => '%s@messaging.sprintpcs.com',
  'T-Mobile' => '%s@tmomail.net',
  'US Cellular' => '%s@email.uscc.net',
  'Verizon' => '%s@vtext.com',
  'Virgin Mobile' => '%s@vmobl.com',
}

ExceptionNotifier.exception_recipients = %w(seven1m@gmail.com)
ExceptionNotifier.sender_address =
  %("Rails App Error" <app-error@cedar.ridge.cc>)