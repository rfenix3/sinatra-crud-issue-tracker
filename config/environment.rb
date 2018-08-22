ENV['SINATRA_ENV'] ||= "development"

require 'bundler/setup'
Bundler.require(:default, ENV['SINATRA_ENV'])

ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :database => "db/#{ENV['SINATRA_ENV']}.sqlite"
)

require_relative '../app/controllers/application_controller.rb'
require_relative '../app/controllers/issues_controller.rb'
require_relative '../app/controllers/supports_controller.rb'

require_all 'app'
