class CharasController < ApplicationController
  def new
    @chara = Chara.new
  end

  def create
    @chara = Chara.new(chara_params)
    if @chara.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @feeling = %w[喜 怒 哀 楽]
    @chara = Chara.find(params[:id])
    @message_contents = @chara.message_contents
  end

  private

  def chara_params
    params.require(:chara).permit(:name, :image).merge(user_id: current_user.id)
  end
end
