class Question < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :created_survey
  has_many :possible_choices
  has_many :responses
end
