get '/users/new' do
  erb :"_signup_form"
end

post '/users/new' do
  if params[:password] == params[:confirm_password]
    pass = BCrypt::Password.create(params[:password])
    User.create(email: params[:email], password_hash: pass)
    redirect ('/secret')
  else
    redirect ('/')
  end
end
