#join the rsvp
post '/rsvps' do
  Rsvp.create(participant_id: session[:user_id], route_id: params[:route_id])
  if request.xhr?
    participants = Route.find(params[:route_id]).participants.count
    {id: params[:route_id], participants: participants}.to_json
  else
    redirect "/routes/#{params[:route_id]}"
  end
end

delete '/rsvps' do
  @rsvp = Rsvp.where(participant_id: session[:user_id], route_id: params[:route_id]).first
  @rsvp.destroy
  if request.xhr?
    participants = Route.find(params[:route_id]).participants.count
    {id: params[:route_id], participants: participants}.to_json
  else
    redirect "/routes/#{params[:route_id]}"
  end
end
