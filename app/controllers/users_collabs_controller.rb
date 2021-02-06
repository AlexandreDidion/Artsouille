class UsersCollabsController < ApplicationController
  def new
    @collab = Collab.find(params[:collab_id])
    user_to_removed = @collab.users
    @filtered_users = User.all.reject { |user| user_to_removed.include?(user) }
    @users_collab = @collab.users_collabs.build
  end

  def create
    @users_collab = UsersCollab.new(user_collab_params)
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
    params.require(:users_collab).permit(:user_id, :collab_id)
  end
end
