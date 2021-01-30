class WorkOfArtsController < ApplicationController
  before_action :set_work_of_arts, only: [:show]

  def index
    @work_of_arts = WorkOfArt.all
  end

  def show
  end


  private

  def set_work_of_arts
    @work_of_art = WorkOfArt.find(params[:id])
  end

end
