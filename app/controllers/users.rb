get '/users/new' do
  erb :"_signup_form"
end

post '/users/new' do
  if params[:password] == params[:confirm_password]
    pass = BCrypt::Password.create(params[:password])
    User.create(email: params[:email], password_hash: pass)
    redirect ('/')
  else
    redirect ('/')
  end
end

get '/users/:id' do
  @user = User.find(params[:id])
  if @user == current_user
    erb :profile
  else
    redirect '/user/login'
  end
end
