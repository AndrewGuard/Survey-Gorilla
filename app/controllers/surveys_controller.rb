# Create a new survey with its questions an associated responses

get '/surveys/new' do
  # NO AJAX/JS YET OR I WILL END YOU

  erb :new_survey
end

# Save the survey with all its associated questions
post '/surveys/new' do

end

# Display a list of all surveys
get '/surveys' do
  # display a list of links to all surveys
end

# Display the stats about a given survey
get '/surveys/:id/results' do
  # display a page with charts showing user responses for the given survey
end

# Display a page for the user to take a survey
get '/surveys/:id' do

end

# Save the user's responses to the survey
post '/surveys/:id' do

end