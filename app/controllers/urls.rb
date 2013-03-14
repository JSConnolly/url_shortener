# TODO implement "redirects" model

before do 
  @urls = Url.order("clicks DESC").limit(15)
end

get '/' do
  # let user create new short URL, display a list of shortened URLs
  redirect ('/urls')
end

get '/urls' do
  erb :index
end

post '/urls' do
  @url = Url.create(long_url: params[:long_url])
  if @url.valid?
    redirect ('/')
  else
    erb :index
  end
end

# e.g., /q6bda
get '/:short_url' do
  pass if '/signup'
  pass if '/login'
  url_obj = Url.where('short_url = ?', params[:short_url])[0]
  url_obj.clicks +=1
  url_obj.save  
  if url_obj.long_url =~ /http/
    redirect "http://" + url_obj.long_url.gsub(/http:\/\//, "")
  else
    redirect "http://" + url_obj.long_url
  end

end
