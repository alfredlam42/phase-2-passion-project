helpers do
  def is_participant?(route_id)
    Event.where(participant_id: session[:user_id], route_id: route_id).first != nil
  end
end
