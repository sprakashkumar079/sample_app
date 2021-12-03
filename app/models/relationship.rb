=begin
This is Relationship class as well know as Relationship model and in this some
relationship conditions and adding some validations for users.
=end
class Relationship < ApplicationRecord
  belongs_to :follower, class_name: "User"
  belongs_to :followed, class_name: "User"
  validates :follower_id, presence: true
  validates :followed_id, presence: true
end
