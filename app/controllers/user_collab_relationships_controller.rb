class UserCollabRelationshipsController < ApplicationController
  before_action :set_user_collab_relationship, only: [:update]

  def index
    @user_collab_relationships = UserCollabRelationship.includes(:collab).where(user: current_user)
  end

  def new
    @collab = Collab.find(params[:collab_id])
    user_to_removed = @collab.users
    @filtered_users = User.all.reject { |user| user_to_removed.include?(user) }
    @user_collab_relationship = @collab.user_collab_relationships.build
  end

  def create
    @user_collab_relationship = UserCollabRelationship.new(user_collab_relationship_params)
    if @user_collab_relationship.save
      redirect_to collab_path(@user_collab_relationship.collab)
    else
      render 'new'
    end
  end

  def destroy
    @users_collab_relationship = UserCollabRelationship.find(params[:id])
    @users_collab_relationship.destroy
    redirect_to collab_path(@users_collab_relationship.collab)
  end

  def update
    @user_collab_relationship.update(user_collab_relationship_params)
    if @user_collab_relationship.accepted?
      redirect_to collab_path(@user_collab_relationship.collab_id)
    else
      redirect_to collabs_path
    end
  end

  private

  def set_user_collab_relationship
    @user_collab_relationship = UserCollabRelationship.find(params[:id])
  end

  def user_collab_relationship_params
    params.require(:user_collab_relationship).permit(:user_id, :collab_id, :status)
  end
end
