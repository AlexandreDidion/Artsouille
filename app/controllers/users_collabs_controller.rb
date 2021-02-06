class UsersCollabsController < ApplicationController
  def new
    @collab = Collab.find(user_collab_params[:collab_id])
    user_to_removed = @collab.users
    @filtered_users = User.all.reject { |user| user_to_removed.include?(user) }
    @users_collab = UsersCollab.new
  end

  def create
    @users_collab = UsersCollab.new(user: find_user, collab: find_collab)
    if @users_collab.save
      redirect_to collab_path(@users_collab.collab)
    else
      render 'new'
    end
  end

  def destroy
    @users_collab = UsersCollab.find(params[:id])
    @users_collab.destroy
    redirect_to collab_path(@users_collab.collab)
  end

  private

  def user_collab_params
    params.permit(:collab_id)
  end

  def create_user_collab_params
    params.require(:users_collab).permit(:user)
  end

  def find_user
    User.find(create_user_collab_params[:user])
  end

  def find_collab
    Collab.find(user_collab_params[:collab_id])
  end
end
