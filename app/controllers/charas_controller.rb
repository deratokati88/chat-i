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

  private
  
  def chara_params
    params.require(:chara).permit(:name,:image)
  end
end
