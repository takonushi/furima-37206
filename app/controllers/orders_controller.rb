class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_item, only: [:index, :create]


  def index
    @order_sending = OrderSending.new
    redirect_to root_path if !@item.order.nil? || @item.user_id == current_user.id
  end

  def create
    @order_sending = OrderSending.new(order_params)
    if @order_sending.valid?
      pay_item
      @order_sending.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_sending).permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :telephone_number).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token], price: params[:price]
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end
end
