class CollabsController < ApplicationController
  before_action :set_collab, only: [:show, :edit, :update, :destroy]

  def index
    if params[:query] == 'my_collabs'
      @collabs = Collab.joins(:user_collab_relationships).where('user_id = ?', current_user)
    else
      @collabs = Collab.all
    end
  end

  def show; end

  def new
    @collab = Collab.new
  end

  def create
    @collab = Collab.new(collab_params)
    if @collab.save
      UserCollabRelationship.create(collab: @collab, user: current_user)
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
    params.require(:collab).permit(:name, user_ids: [])
  end
end
