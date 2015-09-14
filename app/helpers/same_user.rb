helpers do
  def same_user?(user_id)
    session[:user_id] == user_id
  end
end
