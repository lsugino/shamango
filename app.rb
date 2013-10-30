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
  member = Member.new
  member.first_name = params[:first_name]
  member.last_name = params[:last_name]
  member.email = params[:email]
  member.password = params[:password]
  member.save 
  redirect '/'
end