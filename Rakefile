require 'sinatra/activerecord/rake'
require './app'

namespace :db do
  desc "create the postgres database"
  task :create do
    `createdb shamango`
  end

  desc "drop the postgres database"
  task :drop do
    `dropdb shamango`
  end
end
