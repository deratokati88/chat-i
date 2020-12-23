class MessagesController < ApplicationController
  def index
    @message = Message.new
    idetify_room_message
  end

  def create
    @room = Room.find(params[:room_id])
    @message = @room.messages.new(message_params)
    if @message.save
      redirect_to room_messages_path(@room)
    else
      @messages = @room.messages.includes(:user)
      render :index
    end
  end

  private
  def message_params
    params.require(:message).permit(:content, :feeling_id).merge(user_id: current_user.id)
  end

  def idetify_room_message
    @room = Room.find(params[:room_id])
    @messages = @room.messages.includes(:user)
  end


end
