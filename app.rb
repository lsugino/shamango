require 'sinatra'
require 'active_record'
require_relative './app/models/member'


ActiveRecord::Base.establish_connection(adapter: 'postgresql',
                                        database: 'shamango')

get '/' do
   erb :index  
end
