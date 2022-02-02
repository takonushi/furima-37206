class OrdersController < ApplicationController
  
  def index
    @item = Item.find(params[:item_id])
  end

  def create
    @order = Order.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      Sending.create(sending_params)
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private
  def order_params
    #params.require(:order).permit(:item_id).merge(user_id: current_user.id)の
    #記載だと「param is missing or the value is empty:order」というエラーになる。
    #別途、確認が必要。
    params.permit(:item_id).merge(user_id: current_user.id, token: params[:token], price: params[:price])
  end

  def sending_params
    params.permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :telephone_number).merge(order_id: @order.id)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: order_params[:price],  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

end
