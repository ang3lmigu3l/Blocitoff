class ItemsController < ApplicationController

before_action :authenticate_user!, only: [:new, :create]
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.user = current_user

    if @item.save
      flash[:notice] = 'Item saved successfully.'
      redirect_to current_user
    else
      flash[:notice] = 'Item not saved. Title is too short or missing. Please try again.'
      redirect_to(:back)
    end
  end

  def show
    @item = Item.find(params[:id])
  end

private

  def item_params
    params.require(:item).permit(:name)
  end
end
