require 'bundler'
Bundler.require
require 'colorize'
ActiveRecord::Base.logger = nil


ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')
# require_all 'lib'
require_all 'app'
