require 'sinatra'

get '/' do
  'hello - divya'
end

get '/testget/:name' do
  "hello , #{params[:name]}"
end
