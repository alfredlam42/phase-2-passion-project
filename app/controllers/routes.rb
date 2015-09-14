#see all routes
get '/routes' do
  @routes = Route.all
  erb :'/routes/index'
end

#create a route form
get '/routes/new' do
  erb :'/routes/new'
end

#creates a route
post '/routes' do
  @route = Route.create(params[:route])
  if @route.save
    Event.create(participant_id: session[:user_id], route_id: @route.id, host: true)
    redirect '/routes'
  else
    @errors = @route.errors.full_messages
    erb :'/routes/new'
  end
end

#individual route info
get '/routes/:route_id' do
  @route = Route.find(params[:route_id])
  @events = Event.where(route_id: params[:route_id])
  erb :'routes/info'
end

#deletes the route
delete '/routes/:route_id' do
  @route = Route.find(params[:route_id])
  @route.destroy
  redirect '/routes'
end
