class Response < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :completed_survey
  belongs_to :question
  belongs_to :possible_choice
end
