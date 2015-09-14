#join the event
post '/events/:route_id' do
  Event.create(participant_id: session[:user_id], route_id: params[:route_id])
  redirect "/routes/#{params[:route_id]}"
end

delete '/events/:route_id' do
  @event = Event.where(participant_id: session[:user_id], route_id: params[:route_id]).first
  @event.destroy
  redirect "/routes/#{params[:route_id]}"
end
