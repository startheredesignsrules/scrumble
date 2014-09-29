class StatusUpdate < ActiveRecord::Base
  # Looks for user_id
  belongs_to :user
  
  has_many :comments
end
