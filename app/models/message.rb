class Message < ApplicationRecord
  belongs_to :room
  belongs_to :user
  has_one :chara_message
  has_one :message_content

  validates :content, :feeling_id, presence: true

  after_create_commit do
    chara_messages_build
  end

  private

  def chara_messages_build
    @message = Message.last
    @room = Room.find(@message.room_id)
    @content = ''
    content_create
    @chara_message = CharaMessage.new
    @chara_message.content = @content
    @chara_message.feeling_id = @message.feeling_id
    @chara_message.message_id = @message.id
    @chara_message.chara_id = @room.chara_id
    @chara_message.room_id = @room.id
    @chara_message.save
  end

  def content_create
    target_id = MessageContent.where(chara_id: @room.chara_id,
                                     feeling_id: @message.feeling_id).where(MessageContent.arel_table[:favo].lteq(@room.favo)).pluck(:id).sample(1)
    if target_id == []
      @content = 'へー'
    else
      @content = MessageContent.find(target_id[0])
      @content = @content.content
    end
  end
end
