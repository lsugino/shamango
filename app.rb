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

post '/' do
  @member = Member.find_by email: params[:email]
  if @member.password == params[:password]
    session[:logged_in_user_id] = @member.id
    redirect '/'
  else
    session[:password_wrong] = true
    redirect '/'
  end
end

get '/new' do
  erb :create_user
end

post '/new' do
  p params
  @member = Member.new
  @member.first_name = params[:first_name]
  @member.last_name = params[:last_name]
  @member.email = params[:email]
  @member.password = params[:password]
  @member.save 
  p @member
  session[:logged_in_user_id] = @member.id
  p session
  redirect '/'
end

get '/logout' do
  session.clear
  erb :logout
end

get '/:member' do
  @member = Member.find_by first_name: params[:member]
  erb :member
end

post '/:member' do
  @member = Member.find_by_id(session[:logged_in_user_id])
  Post.create contents: params[:contents],
              member_id: session[:logged_in_user_id]
  redirect '/'
  # redirect "/#{@member.first_name}"
end


