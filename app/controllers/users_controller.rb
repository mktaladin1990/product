class UsersController < ApplicationController
  # def show
  #   p current_user.id
  #   p "----------------"
  #   a= Integer(params[:id])
  #   if  current_user.id != a
  #     redirect_to root_path
  #   end
  #   else
  #   @user = current_user
  # end
  def edit
      @user = User.find_by_id(params[:id])

  end
  def update
    @user = User.find_by_id(params[:id])
     if @user.update(user_params)
       redirect_to admin_users_path
      else
      render 'edit'
    end
  end
  def destroy
    @user = User.find_by_id(params[:id])
    @user.destroy
    redirect_to admin_users_path
  end
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Register success"
      redirect_to login_path
    else
      flash[:success] = "Register failed"
      render :new
    end
  end
  private
  def user_params
    params.require(:user).permit :email, :name, :role, :avatar,:password, :password_confirmation
  end
end
