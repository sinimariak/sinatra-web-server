enable :sessions

get '/' do
	@urls = Url.all
	@url = url
	erb :"static/index"
end

post '/urls' do 
	short_url = Url.generate_short_url
	url = Url.create(long_url: params[:long_url], shortened_url: short_url)
	url.valid?
	session['error_message'] = url.errors.messages

	redirect "/"
end

get '/:shortened_url' do
	url = Url.find_by(shortened_url: params[:shortened_url])
	url.update(click_count: url.click_count + 1)
	redirect url.long_url
end

