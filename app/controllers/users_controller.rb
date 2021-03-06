class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_user, only: [:show, :edit, :update]

  def index
    if params[:search].present?
      sql_query = " \
          users.username @@ :query \
          OR users.first_name @@ :query \
          OR users.last_name @@ :query \
          OR users.country @@ :query \
          OR users.city @@ :query \
          OR users.art_type @@ :query \
          OR work_of_arts.name @@ :query \
          OR work_of_arts.description @@ :query \
        "
      @users = User.joins(:work_of_arts).where(sql_query, query: "%#{params[:search][:name]}%").distinct
    else
      @users = User.all
    end
    @markers = @users.geocoded.map do |user|
      {
        lat: user.latitude,
        lng: user.longitude,
        infowindow: render_to_string(partial: "infowindow", locals: { user: user })
      }
    end
  end

  def show; end

  def edit; end

  def update
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:description, :first_name, :last_name, :photo, :art_type)
  end
end
