require 'sinatra'
require 'active_record'
require_relative './app/models/member'
require_relative './app/models/post'


ActiveRecord::Base.establish_connection(adapter: 'postgresql',
                                        database: 'shamango')

get '/' do
  erb :index  
end

get '/create' do
  erb :create_user
end

post '/create_user' do
  member = Member.create 
  p params
end