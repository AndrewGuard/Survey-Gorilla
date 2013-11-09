enable :sessions

get '/' do
  erb :index
end

# Log in an existing user
post '/login' do
  # Lookup user
  user = User.find_by_email(params[:email])
  if user
    user.authenticate(params[:password])
    if user
      session[:user_id] = user.id
      redirect to "/user/#{user.id}"
    else
      @errors = "Password incorrect"
      erb :index
    end
  else
    @errors = "Email not found, please create an account"
    erb :index
  end
end

# Create a new user
post '/create_account' do
  user = User.create(name: params[:name], email: params[:email], password: params[:password])
  if user.id
    session[:user_id] = user.id
    redirect to "/user/#{user.id}"
  else
    @errors = user.errors.full_messages
    erb :index
  end
end

get '/logout' do
  session.clear

  redirect to '/'
end

# Display home page of logged in user
get '/user/:id' do
  @user = User.find(params[:id])
  @created_surveys = @user.created_surveys
  #display a page with buttons and/or links to create a survey or take a survey
  erb :user
end























