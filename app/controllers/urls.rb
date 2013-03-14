# TODO implement "redirects" model

before do 
  @urls = Url.order("clicks DESC").limit(15)
end

get '/' do
  # let user create new short URL, display a list of shortened URLs
  erb :index
end

# get '/urls' do
#   puts "------------------> whee"
#   erb :index
# end

post '/urls' do
  if current_user
    id = @current_user.id
  else
    id = nil
  end
  @url = Url.create(long_url: params[:long_url], user_id: id)
  if @url.valid?
    redirect ('/')
  else
    erb :index
  end
end

# e.g., /q6bda
get '/:short_url' do
  # pass if params[:short_url] =~ /favico/
  # pass if 
  puts "------------------> whee2 -- #{params[:short_url]}"

  url_obj = Url.where('short_url = ?', params[:short_url])[0]
  url_obj.clicks +=1
  url_obj.save  
  if url_obj.long_url =~ /http/
    redirect "http://" + url_obj.long_url.gsub(/http:\/\//, "")
  else
    redirect "http://" + url_obj.long_url
  end

end
