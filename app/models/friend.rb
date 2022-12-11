
# TODO maybe rename Friend to Contact
class Friend < ApplicationRecord
  belongs_to :user

  validates_presence_of :user_id, :friend_id
end
