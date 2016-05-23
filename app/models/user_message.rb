class UserMessage < ActiveRecord::Base
  validates :user_id, presence: true
  validates :message_id, presence: true
  belongs_to :user
  belongs_to :message
end
