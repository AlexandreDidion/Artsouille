class ExhibitionsController < ApplicationController
  before_action :set_collab, only: [:show, :new, :create]
  # before_action :set_exhibition, only: [:destroy]

  def index
    @exhibitions = Exhibition.all
  end

  def show
  end

  def new
    @exhibition = Exhibition.new
  end

  def create
    @exhibition = Exhibition.new(exhibition_params)
    @exhibition.collab = @collab
    @exhibition.user = current_user
    if @exhibition.save
      redirect_to collab_path(@collab)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @exhibition.update(exhibition_params)
      redirect_to exhibition_path(@exhibition), notice: 'Exhibition is updated'
    else
      render :edit
    end
  end

    private

  def set_collab
    @collab = Collab.find(params[:collab_id])
  end

  def set_exhibition
    @exhibition = Exhibition.find(params[:id])
  end

  def exhibition_params
    params.require(:exhibition).permit(:collab_id, :name, :start_date, :end_date, :description, :category, :address)
  end
end
