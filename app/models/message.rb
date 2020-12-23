class Message < ApplicationRecord
  belongs_to :room
  belongs_to :user

  validates :content,:feeling_id, presence: true
end
