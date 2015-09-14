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
  params[:route][:creator_id] = session[:user_id]
  @route = Route.create(params[:route])
  if @route.save
    redirect '/routes'
  else
    @errors = @route.errors.full_messages
    erb :'/routes/new'
  end
end

#individual route info
get '/routes/:route_id' do
  @route = Route.find(params[:route_id])
  erb :'routes/info'
end

delete '/routes/:route_id' do
  @route = Route.find(params[:route_id])
  @route.destroy
  redirect '/routes'
end
