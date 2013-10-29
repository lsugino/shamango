require 'sinatra'
require 'active_record'
require_relative './app/models/elephant'

ActiveRecord::Base.establish_connection(adapter: 'postgresql',
                                        database: 'sinatra_skeleton_dev')

get '/' do
  "Hello World!"
end
