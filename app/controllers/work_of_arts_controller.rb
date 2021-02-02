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

  def new
    @work_of_art = WorkOfArt.new
  end

  def create
    @work_of_art = WorkOfArt.new(work_of_art_params)
    @work_of_art.user = current_user
    if @work_of_art.save
      redirect_to work_of_art_path(@work_of_art)
    else
      render :new
    end
  end

  def update
    if @work_of_art.update(work_of_art_params)
      redirect_to user_work_of_art_path(@work_of_art), notice: 'Your artpage is updated'
    else
      render :edit
    end
  end

  private

  def set_work_of_arts
    @work_of_art = WorkOfArt.find(params[:id])
  end

  def work_of_art_params
    params.require(:work_of_art).permit(:name, :description, :creation_date, photos: [])
  end
end
