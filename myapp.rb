require 'sinatra'
require 'pony'
require 'haml'
require 'json'

get '/' do
  'hello - divya'
end

get '/testget/:name' do
  "hello , #{params[:name]}"
end


post '/sendemail' do
	'sending email'
	
	params = JSON.parse request.body.read #.to_s
	#"param received: #{params['subject']}" #.to_s}"

	options = {
    :to => "#{params['to']}",
    :from => 'noreply@example.com',
    :subject => "#{params['subject']}",
    :body => "#{params['body']}",
    :via => :smtp,
    :via_options => {
      :address => 'smtp.gmail.com',
      :port => 587,
      :user_name => 'divyaemailtest@gmail.com',
      :password => 'divyaemail'
  	}
}

Pony.mail(options)
end
