get '/users/login' do
  erb :"_login_form"
end

post '/users/login' do
  if User.authenticate(params[:email], params[:password])
    token = SecureRandom.hex(10)
    session[:token] = token
    user = User.find_by_email(params[:email])
    puts token
    user.token = token
    user.save
    current_user
    redirect ('/')
  else
    redirect ('/users/login')
  end
end


delete '/users/signout' do
  session[:token] = nil 
  redirect '/'
end


