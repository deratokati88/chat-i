class MessageContentsController < ApplicationController
  def new
    @chara = Chara.find(params[:chara_id])
  end
end
