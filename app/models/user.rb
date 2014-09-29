class User < ActiveRecord::Base
  # One To Many Association
  has_many :status_updates

  # Many To Many Association, Creates Join Table?
  has_many :comments, :through => :status_updates
end
