class CollabsController < ApplicationController
  before_action :set_collab, only: [:show, :edit, :update, :destroy]

  def index
    @collabs = Collab.all
  end

  def show;end

  def new
    @collab = Collab.new

  def create
    @collab = Collab.new(collab_params)
    if @collab.save
      redirect_to collab_path(@collab), notice: 'Ready to start a new collab!'
    else
      render 'new'
    end
  end

  def edit;end

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
    params.require(:collab).pemit(:name)
  end
end
