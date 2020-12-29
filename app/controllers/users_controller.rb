class UsersController < ApplicationController
  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def show
    user_find
    move_to_index
    @charas = @user.charas
  end

  private

  def user_find
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :image)
  end

  def move_to_index
    redirect_to root_path unless @user.id == current_user.id
  end
end
