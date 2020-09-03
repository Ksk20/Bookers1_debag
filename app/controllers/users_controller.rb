class UsersController < ApplicationController
 def show
	@user =User.find(paramus[:id])
 end

 def create
	@users = User.new(user_params)
	@users.user_id = current_user.id
	@user.save
	flash[:notice] = "Welcome! You have signed up successfully."
	redirect_to user_path
 end

 def index
	@user = User.new
	@Users = User.all
 end

 def edit
	@user =User.find(params[:id])
 end

 def update
	@user =User.find(params[:id])
	if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(@user.id)
   	else
      render :edit
    end
 end

private
 def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
 end
 def correct_user
    user = User.find(params[:id])
    if current_user != user
      redirect_to user_path(current_user)
    end
 end



end
