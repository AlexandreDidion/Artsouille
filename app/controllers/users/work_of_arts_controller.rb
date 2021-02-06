class WorkOfArtsController < ApplicationController
  def index
    user = User.find(params[:user_id])
    @work_of_arts = user.work_of_arts

    render 'work_of_arts/index'
  end
end
