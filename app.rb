require 'sinatra'
require 'active_record'
require_relative './app/models/member'
require_relative './app/models/post'


ActiveRecord::Base.establish_connection(adapter: 'postgresql', database: 'shamango')

get '/' do
  p "hello"
  erb :login
end

post'/' do
  @member = Member.find_by email: params[:email]
  p params[:password]
  p @member.password
  p @member.password == params[:password]
end

get '/home' do
  erb :home
end

get '/new' do
  erb :create_user
end

post '/new' do
  @member = Member.new
  @member.first_name = params[:first_name]
  @member.last_name = params[:last_name]
  @member.email = params[:email]
  @member.password = params[:password]
  @member.save 
  redirect '/home'
end