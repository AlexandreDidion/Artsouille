class ToDosController < ApplicationController
  before_action :set_to_do, only: [:edit, :update, :destroy]
  before_action :set_collab, only: [:new, :create]

  def new
    @to_do = ToDo.new
  end

  def create
    @to_do = ToDo.new(to_do_params)
    @to_do.collab = @collab
    if @to_do.save
      redirect_to collab_path(@to_do.collab)
    else
      render 'new'
    end
  end

  def edit; end

  def update
    @to_do.update(to_do_params)
    redirect_to collab_path(@to_do.collab), notice: 'Idea added'
  end

  def destroy
    @to_do.destroy
    redirect_to collab_path(@to_do.collab)
  end

  private

  def set_collab
    @collab = Collab.find(params[:collab_id])
  end

  def set_to_do
    @to_do = ToDo.find(params[:id])
  end

  def to_do_params
    params.require(:to_do).permit(:title)
  end
end
