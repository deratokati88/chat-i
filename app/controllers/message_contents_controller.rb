class MessageContentsController < ApplicationController
  before_action :idetify_chara, only: [:new, :create, :edit, :update, :destroy]
  before_action :move_to_index, only: [:new, :create, :edit, :update, :destroy]
  before_action :idetify_message_content, only: [:edit, :update, :destroy]
  
  def new
    @message_content = MessageContent.new
  end

  def create
    @message_content = MessageContent.new(message_content_params)
    if @message_content.save
      redirect_to chara_path(@chara.id)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @message_content.update(message_content_params)
      redirect_to chara_path
    else
      render :edit
    end
  end

  def destroy
    @message_content.destroy
    redirect_to chara_path(@message_content.chara_id)
  end

  private
  def idetify_chara
    @chara = Chara.find(params[:chara_id])
  end

  def idetify_message_content
    @message_content = MessageContent.find(params[:id])
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
