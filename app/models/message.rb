class Message < ApplicationRecord
  belongs_to :room
  belongs_to :user
  has_one :chara_message

  validates :content,:feeling_id, presence: true

  after_commit do
    chara_messages_build
  end

  private

  def chara_messages_build
    @message = Message.last
    @room = Room.find(@message.room_id)
    @content = MessageContent.find(1)
    @chara_message = CharaMessage.new
    @chara_message.content = @content.content
    @chara_message.feeling_id = @message.feeling_id
    @chara_message.message_id = @message.id
    @chara_message.chara_id = @room.chara_id
    @chara_message.room_id = @room.id
    @chara_message.save
  end

end
