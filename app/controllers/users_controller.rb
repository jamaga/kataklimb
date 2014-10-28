class UsersController < ApplicationController

	def index
		page  = params[:page].to_i || 1
		@users = User.order("id ASC").page(page)
	end

	def show
    @user = User.find(params[:id])
  end

  def destroy
    user = User.find(params[:id]).destroy
    redirect_to users_path
  end

  def edit
    authorize @user
  end

	def update
    authorize @user

    if @user.update(users_params)
      flash[:notice] = "User updated successfully"

      redirect_to user_path(@user)
    else
      flash[:error]  = "Ops! We couldn't update the user, please review the errors"
      render :edit
    end
  end

  private

  def load_user
    @user = User.find(params[:id])
  end

  def users_params
    params.require(:user).permit(:name)
  end
  
end
