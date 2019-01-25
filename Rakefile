require_relative 'config/environment.rb'
require "sinatra/activerecord/rake"

namespace :db do

  desc "Migrate the db"
  task :migrate do
    connection_details = YAML::load(File.open('/Users/JoCake/Desktop/AccessLab/module-one-final-project---dumbo-web-010719-module-one-final-project-1547852832/config/database.yml'))
    ActiveRecord::Base.establish_connection(connection_details)
    ActiveRecord::Migrator.migrate("db/migrate/")
  end

  desc "drop and recreate the db"
  task :reset => [:drop, :migrate]

  desc "drop the db"
  task :drop do
    connection_details = YAML::load(File.open('/Users/JoCake/Desktop/AccessLab/module-one-final-project---dumbo-web-010719-module-one-final-project-1547852832/config/database.yml'))
    File.delete(connection_details.fetch('database')) if File.exist?(connection_details.fetch('database'))
  end

  desc "start console"
  task :console do
    Pry.start
  end
end
