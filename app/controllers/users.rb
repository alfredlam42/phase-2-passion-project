get '/session-viewer' do
  session.inspect
end

#registration form
get '/users/new' do
  erb :'/users/new'
end

#creates new user
post '/users' do
  @user = User.create(params[:user])
  if @user.save
    redirect '/routes'
  else
    @errors = @user.errors.full_messages
    erb :'/users/new'
  end
end

#log in form
get '/users/login' do
  erb :'/users/login'
end

#log in
post '/users/login' do
  @user = User.find_by(user_name: params[:user_name])
  p "*" * 50
  p @user
  p @params[:password]
  p "*" * 50
  if @user.login(params[:password])
    session[:user_id] = @user.id
    redirect "/users/#{@user.id}"
  else
    @errors = 'E-mail or password is incorrect'
    erb :'/users/login'
  end
end

#log out
get '/users/logout' do
  session[:user_id] = nil
  redirect '/'
end

#profile page
get '/users/:user_id' do
  @user = User.find(params[:user_id])
  erb :'/users/profile'
end
