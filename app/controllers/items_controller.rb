class ItemsController < ApplicationController

before_action :authenticate_user!, only: [:new, :create, :destroy]

  def create
    @user = User.find(params[:user_id])
    @item = @user.items.new(item_params)
    @new_item = Item.new

    if @item.save
      flash[:notice] = 'Item saved successfully.'
    else
      flash[:alert] = 'Item not saved. Title is too short or missing. Please try again.'
    end

    respond_to do |format|
      format.html
      format.js
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @user = current_user
    if @item.destroy
      flash[:notice] = "Item Completed"
    else
      flash[:alert] = "Item was unable to be marked completed "
    end

    respond_to do |format|
      format.html
      format.js
    end
  end

#____________________PRIVATE________________#

private

  def item_params
    params.require(:item).permit(:name)
  end
end
