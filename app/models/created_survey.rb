require_relative "../../lib/uploaders/photo_uploader.rb"
class CreatedSurvey < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :user
  has_many :questions
  has_many :completed_surveys

end
