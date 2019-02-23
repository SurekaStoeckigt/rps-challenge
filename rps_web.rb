require "sinatra/base"
require_relative './lib/player.rb'

class RPS_web < Sinatra::Base
enable :sessions

get '/' do
  erb :index
end

post '/player' do
  session[:name] = Player.new(params[:name]).name
  redirect('/play')
end

get '/play' do
  @name = session[:name]
  erb(:player)
end

run! if app_file == $0
end
