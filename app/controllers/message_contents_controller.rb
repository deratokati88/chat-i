class MessageContentsController < ApplicationController
  before_action :idetify_chara, only: [:new, :create]
  before_action :move_to_index, only: [:new, :create]
  
  def new
    @message_content = MessageContent.new
  end

  def create
    @message_content = MessageContent.new(message_content_params)
    if @message_content.save
      redirect_to user_path(@chara.user_id)
    else
      render :new
    end
  end

  private
  def idetify_chara
    @chara = Chara.find(params[:chara_id])
  end

  def message_content_params
    params.require(:message_content).permit(:feeling_id, :favo, :content).merge(chara_id: params[:chara_id])
  end

  def move_to_index
    unless @chara.user_id == current_user.id
      redirect_to root_path
    end
  end
end
