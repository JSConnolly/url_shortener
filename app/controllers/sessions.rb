get '/users/login' do
  erb :"_login_form"
end

post '/users/login' do
  @user = User.find_by_email( params[:email] )
  if @user.password == params[:password]
    give_token(@user)
    redirect ('/')
  else
    redirect ('/users/login')
  end
end


delete '/users/signout' do
  session[:token] = nil 
  redirect '/'
end


