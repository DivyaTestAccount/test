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
	

	begin
		params = JSON.parse request.body.read #.to_s
		#"param received: #{params['subject']}" #.to_s}"
	rescue
		return "invalid post data"
	end

	#check params
	begin
		params.has_value?('subject')
		   if params['subject'].empty? || params['subject'].nil?
		   		return 'invalid subject'
		   end
	rescue
			return 'missing "subject" parameter'
	end

	begin
		params.has_value?('to')
		   if params['to'].empty? || params['to'].nil?
		   		return 'invalid "to" parameter'
		   end
	rescue
			return 'missing "to" parameter'
	end

	begin
		params.has_value?('body')
		   if params['body'].empty? || params['body'].nil?
		   		return 'invalid "body" parameter'
		   end
	rescue
			return 'missing "body" parameter'
	end


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

begin
	Pony.mail(options)
	return 'Email successfully sent.'
rescue
	return 'Email send failed.'
end

end
