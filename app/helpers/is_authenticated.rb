helpers do
  def is_authenticated?
    !session[:user_id].nil?
  end
end
