class WorkOfArtsController < ApplicationController
  before_action :set_work_of_arts, only: [:show]

  def index
    if params[:query] == 'my_arts'
      @work_of_arts = WorkOfArt.where('user_id = ?', current_user)
    else
      @work_of_arts = WorkOfArt.all
    end
  end

  def show
  end

  private

  def set_work_of_arts
    @work_of_art = WorkOfArt.find(params[:id])
  end

  def work_of_art_params
    params.require(:work_of_art).permit(:name, :description, :creation_date, photos: [])
  end
end
