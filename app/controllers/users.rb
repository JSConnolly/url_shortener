get '/users/new' do
  erb :"_signup_form"
end

post '/users/new' do
  if params[:password] == params[:confirm_password]
    @user = User.new(email: params[:email])
    @user.password = params[:password]
    if @user.valid?
      give_token(@user)
      redirect '/'
    else
      redirect '/users/new'
    end

  else
    #add password mismatch error to session
    redirect '/users/new'
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
