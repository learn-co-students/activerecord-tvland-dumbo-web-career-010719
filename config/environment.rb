require "bundler/setup"
require "sinatra/activerecord"
require 'sqlite3'
require "table_print"
require "tty-prompt"
require 'rainbow/refinement'
require 'tty-font'
using Rainbow



# db = SQLite::Database.new "path/to/file.sqlite"
# db.execute "WRITE YOUR QUERY HERE"
Bundler.require
Dir[File.join(File.dirname(__FILE__), "../app/models", "*.rb")].each {|f| require f}
# puts "This is the directoy:"
# puts Dir.pwd
connection_details = YAML::load(File.open('/Users/JoCake/Desktop/AccessLab/module-one-final-project---dumbo-web-010719-module-one-final-project-1547852832/config/database.yml'))
ActiveRecord::Base.establish_connection(connection_details)
ActiveRecord::Base.logger = nil
