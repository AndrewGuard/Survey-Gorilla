class CompletedSurvey < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :user
  belongs_to :created_survey
  has_many :responses
end
