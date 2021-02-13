class ToDoItemsController < ApplicationController
  before_action :set_to_do, only: [:new, :create]
  before_action :set_to_do_items, only: [:destroy]
  def new
    @to_do_item = ToDoItem.new
  end

  def create
    @to_do_item = ToDoItem.new(to_do_items_params)
    @to_do_item.to_do = @to_do
    if @to_do_item.save
      redirect_to collab_path(@to_do.collab)
    else
      render 'new'
    end
  end

  def destroy
    @to_do_item.destroy
    redirect_to collab_path(@to_do_item.to_do.collab)
  end

  private

  def set_to_do_items
    @to_do_item = ToDoItem.find(params[:id])
  end

  def set_to_do
    @to_do = ToDo.find(params[:to_do_id])
  end

  def to_do_items_params
    params.require(:to_do_item).permit(:content)
  end
end
