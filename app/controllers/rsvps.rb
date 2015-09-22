#join the rsvp
post '/rsvps' do
  Rsvp.create(participant_id: session[:user_id], route_id: params[:route_id])
  redirect "/routes/#{params[:route_id]}"
end

delete '/rsvps' do
  @rsvp = Rsvp.where(participant_id: session[:user_id], route_id: params[:route_id]).first
  @rsvp.destroy
  redirect "/routes/#{params[:route_id]}"
end
