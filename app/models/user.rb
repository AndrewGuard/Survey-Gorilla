class User < ActiveRecord::Base
  # Remember to create a migration!
  has_many :created_surveys
  has_many :completed_surveys

  has_secure_password
end
