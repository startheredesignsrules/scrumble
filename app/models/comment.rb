class Comment < ActiveRecord::Base
  # ActiveRecord associations (how db tables are related to one another)
  # There are various types: belongs_to, has_many, has_one

  # Looks for status_update_id
  belongs_to :status_update

  # Looks for user_id
  belongs_to :user
end
