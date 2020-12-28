class MessageContentsController < ApplicationController
  def new
    @chara = Chara.find(params[:chara_id])
    @message_content = MessageContent.new
  end

  def create
    @chara = Chara.find(params[:chara_id])
    @message_content = MessageContent.new(message_content_params)
    if @message_content.save
      redirect_to user_path(@chara.user_id)
    else
      render :new
    end
  end

  def message_content_params
    params.require(:message_content).permit(:feeling_id, :favo, :content).merge(chara_id: params[:chara_id])
  end
end
