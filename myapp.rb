require 'sinatra'

get '/' do
  'hello - divya'
end

get '/testget/:name' do
  "hello , #{params[:name]}"
end


post '/sendemail' do
	'sending email'
end
