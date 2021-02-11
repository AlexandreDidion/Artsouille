class WorkOfArtsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  before_action :authenticate_user!, only: :toggle_favorite
  before_action :set_work_of_arts, only: [:show, :edit, :update, :destroy]

  def index
    @work_of_arts = WorkOfArt.all
  end

  def show; end

  def edit; end

  def new
    @work_of_art = WorkOfArt.new
  end

  def create
    @work_of_art = WorkOfArt.new(work_of_art_params)
    @work_of_art.user = current_user
    if @work_of_art.save
      redirect_to user_path(current_user)
    else
      render :new
    end
  end

  def update
    if @work_of_art.update(work_of_art_params)
      redirect_to user_work_of_arts(@work_of_art), notice: 'Your artpage is updated'
    else
      render :edit
    end
  end

  def destroy
    @work_of_art.destroy
    redirect_to work_of_arts_path(@work_of_art), notice: 'Your artwork has been deleted successfully.'
  end

  def toggle_favorite
    @work_of_art = WorkOfArt.find_by(id: params[:id])
    current_user.favorited?(@work_of_art)  ? current_user.unfavorite(@work_of_art) : current_user.favorite(@work_of_art)
  end

  def my_favorites
    @favorite_work_of_arts = current_user.favorited_by_type('WorkOfArt')
  end

  private

  def set_work_of_arts
    @work_of_art = WorkOfArt.find(params[:id])
  end

  def work_of_art_params
    params.require(:work_of_art).permit(:name, :description, :creation_date, :photo, :user_id)
  end
end
