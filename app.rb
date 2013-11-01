require 'sinatra'
require 'active_record'
require 'sinatra/flash'
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
  member = Member.create params
  session[:logged_in_user_id] = member.id
  redirect '/'
end

get '/logout' do
  session.clear
  erb :login
end

get '/:member' do
  # @member = Member.find_by (params[:member].split("_")[0])
  Member.find_each do |member|
    if member.name == params[:member].split("_").join
      @member = member
    end
  end
  erb :member
end

post '/search' do
  names_split = params[:name].split(" ")
  first_name = names_split[0]
  last_name = names_split[1]
  @first_name_matches = []
  Member.find_each do |member|

    if member.first_name == first_name
      @first_name_matches << member
      if member.last_name == last_name
        redirect "/#{member.first_name}_#{member.last_name}"
      end
    end
  end

  if @first_name_matches.empty?
    flash[:notice] = "the person you searched for didn't exist" 
  else 
    flash[:notice] = "here are suggestions:"
  end
  erb :search 
end

get '/search' do
  "thissss be the search page"
end


post '/:member' do
  member = Member.find_by_id(session[:logged_in_user_id])
  Post.create contents: params[:contents],
              member_id: session[:logged_in_user_id]

  redirect "/#{member.first_name}_#{member.last_name}"
end


