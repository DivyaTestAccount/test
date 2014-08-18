require 'sinatra'
require 'pony'
require 'haml'

get '/' do
  'hello - divya'
end

get '/testget/:name' do
  "hello , #{params[:name]}"
end


post '/sendemail' do
	'sending email'
	options = {
    :to => 'divyaemailtest@gmail.com',
    :from => 'noreply@example.com',
    :subject => 'Test',
    :body => 'Test Again',
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
