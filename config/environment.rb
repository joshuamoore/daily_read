# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Load heroku vars from local file
heroku_env = File.join(Rails.root, 'config', 'development_env_variables.rb')
load(heroku_env) if File.exists?(heroku_env)

# Initialize the Rails application.
DailyRead::Application.initialize!
