helpers do
  def is_participant?(route_id)
    Rsvp.where(participant_id: session[:user_id], route_id: route_id).first != nil
  end
end
