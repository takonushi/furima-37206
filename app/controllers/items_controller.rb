class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :delete]
  before_action :set_item, only: [:show, :edit, :update]

  def index
    @items = Item.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
    redirect_to root_path if current_user.id != @item.user_id || !@item.order.nil?
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy if current_user.id == item.user_id && item.order.nil?
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:name, :explanation, :category_id, :condition_id, :charge_id, :prefecture_id, :number_of_days_id,
                                 :price, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
