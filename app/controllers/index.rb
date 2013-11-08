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
      session[:id] = user.id
      redirect to "/user/#{user.id}"
    else
      @error = "Invalid Login"
      erb :index
    end
  end
end

# Create a new user
post '/create_account' do
  user = User.create(name: params[:name], email: params[:email], password: params[:password])
  if user.valid?
    user.authenticate(params[:password])
    if user
      # add user_id to session
      #redirect to '/user/:id'
    else
      @error = "Try again"
      redirect to '/'
    end
  end

# end
# # add user to session
# #redirect to '/user/:id'
end

get '/logout' do
  session.clear

  redirect to '/'
end

# Display home page of logged in user
get '/user/:id' do
  #display a page with buttons and/or links to create a survey or take a survey

  # @my_created_surveys = all surveys created by this user
  # @all_surveys = all surveys
end























