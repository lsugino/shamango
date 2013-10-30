require 'sinatra'
require 'active_record'
require_relative './app/models/member'
require_relative './app/models/post'


ActiveRecord::Base.establish_connection(adapter: 'postgresql', database: 'shamango')

enable :sessions

get '/' do
  if session[:logged_in_user_id]
    erb :index
  else
    erb :login
  end
end

post'/' do
  @member = Member.find_by email: params[:email]
  if @member.password == params[:password]
    session[:logged_in_user_id] = @member.id
    redirect '/'
  else
    @password_wrong = true
    redirect '/'
  end
end

get '/home' do
  @foo = "foo"
  erb :index
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

get '/logout' do
  session.clear
  erb :logout
end