class Admin::UsersController < Admin::ApplicationController
  def index
    @users = User.all
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to admin_users_path
  end

  def upgrade
    @user = User.find(params[:id])
    @user.update(
      role: "admin"
    )
    redirect_to admin_users_path
  end

  def downgrade
    @user = User.find(params[:id])
    @user.update(
      role: "regular"
    )
    redirect_to admin_users_path
  end
end
