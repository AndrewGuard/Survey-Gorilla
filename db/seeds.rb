user = User.create(:name => "Me", :email => "abc@xyz.com", :password => "12345")

created_survey = user.created_surveys.create(:title => "My Survey", :image_file_name => "me.png")

question = created_survey.questions.create(:prompt => "How now brown cow?")

possible_choice_1 = question.possible_choices.create(:text => "A")
possible_choice_2 = question.possible_choices.create(:text => "B")

completed_survey = created_survey.completed_surveys.create(:user_id => 1)

response = completed_survey.responses.create(:question_id => 1, :possible_choice_id => 1)