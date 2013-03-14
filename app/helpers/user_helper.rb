helpers do
  def current_user
    if User.find_by_token(session[:token])
      @current_user ||= User.find_by_token(session[:token])
    end
    @current_user
  end

  def logged_in?
    !current_user.nil?
  end
end
