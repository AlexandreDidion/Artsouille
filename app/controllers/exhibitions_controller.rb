class ExhibitionsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  before_action :set_collab, only: [:new, :create]
  before_action :set_exhibition, only: [:show, :edit, :update, :destroy]

  def index
    if params[:query].present?
      @exhibitions = Exhibition.where('collab_id IN (?)', User.find(params[:query]).collabs.map(&:id))
    else
      @exhibitions = Exhibition.all
    end

    @markers = @exhibitions.geocoded.map do |exhibition|
      {
        lat: exhibition.latitude,
        lng: exhibition.longitude,
        infowindow: render_to_string(partial: "infowindow", locals: { exhibition: exhibition })
      }
    end
  end

  def show; end

  def new
    @exhibition = Exhibition.new
  end

  def create
    @exhibition = Exhibition.new(exhibition_params)
    @exhibition.collab = @collab
    if @exhibition.save
      redirect_to exhibition_path(@exhibition), notice: 'The exhibition has been created!'
    else
      render 'new'
    end
  end

  def edit; end

  def update
    @exhibition.update(exhibition_params)
    redirect_to exhibition_path(@exhibition), notice: 'Duly updated'
  end

  def destroy
    @exhibition.destroy
    redirect_to exhibitions_path, notice: 'Your exhibition has been deleted successfully!'
  end

  private

  def set_collab
    @collab = Collab.find(params[:collab_id])
  end

  def set_exhibition
    @exhibition = Exhibition.find(params[:id])
  end

  def exhibition_params
    params.require(:exhibition).permit(:name, :start_date, :end_date, :description, :category, :address, :city, :country, photos: [])
  end
end
