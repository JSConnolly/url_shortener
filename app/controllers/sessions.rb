get '/users/login' do
  erb :"_login_form"
end

post '/users/login' do
  if User.authenticate(params[:email], params[:password])
    token = SecureRandom.hex(10)
    session[:token] = token
    user = User.find_by_email(params[:email])
    user.token_id = token
    user.save
    redirect ('/secret')
  else
    redirect ('/login')
  end
end


delete '/users/logout' do
end


