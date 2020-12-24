class MessagesController < ApplicationController
  def index
    @message = Message.new
    idetify_room_message
  end

  def create
    @room = Room.find(params[:room_id])
    @message = @room.messages.new(message_params)
    if @message.save
      favo_calc
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
    @messages = @room.messages.includes(:user,:chara_message)
  end

  def favo_calc
    last1_message = Message.last.feeling_id
    last2_message = Message.last(2)[0].feeling_id
    if @room.favo < 100
      if last1_message == last2_message
        @room.favo -= 1
        @room.save
      else
        @room.favo += 1
        @room.save
      end
    end
  end

end
