class ExhibitionsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index ]
  before_action :set_collab, only: [:new]
  before_action :set_exhibition, only: [:show, :destroy]

  def index
    if params[:query] == 'my_exhibitions'
      @exhibitions = Exhibition.where('collab_id IN (?)', current_user.collabs.map(&:id))
    else
      @exhibitions = Exhibition.all
    end

    @markers = @exhibitions.geocoded.map do |exhibition|
      {
        lat: exhibition.latitude,
        lng: exhibition.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { exhibition: exhibition })
      }
    end
  end

  def show; end

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
