class CollabsController < ApplicationController
  before_action :set_collab, only: [:show, :edit, :update, :destroy]

  def index
    if params[:my_collabs]
      @collabs = Collab.joins(:user_collab_relationships).where(user_collab_relationships: { user: current_user, status: [1, 2] })
    else
      @collabs = Collab.joins(:user_collab_relationships).where.not(id: current_user.user_collab_relationships.pluck(:collab_id))
    end
  end

  def show
    @accepted_collab = @collab.user_collab_relationships.where(status: "accepted")
    @accepted_users = @accepted_collab.any? { |collab| collab.user == current_user }
  end

  def new
    @collab = Collab.new
  end

  def create
    @collab = Collab.new(collab_params)
    if @collab.save
      UserCollabRelationship.create(collab: @collab, user: current_user, status: "accepted")
      redirect_to collab_path(@collab), notice: 'Ready to start a new collab!'
    else
      render 'new'
    end
  end

  def edit; end

  def update
    @collab.update(collab_params)
    redirect_to collab_path(@collab), notice: 'Duly updated'
  end

  def destroy
    @collab = Collab.find(params[:id])
    @collab.destroy
    redirect_to collabs_path, notice: 'Your collab has come to an end.'
  end

  private

  def set_collab
    @collab = Collab.find(params[:id])
  end

  def collab_params
    params.require(:collab).permit(:name, :photo, user_ids: [])
  end
end
