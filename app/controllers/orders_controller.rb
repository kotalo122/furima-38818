class OrdersController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :move_to_index, only: [:index, :create]

  def index
    @item = Item.find(params[:item_id])
  end

  def create
    binding.pry
    @order = Order.create(order_params)
    Shipment.create(shipment_params)
    redirect_to root_path
  end

  private

  def order_params
    params.require(:order).permit(:user_id, :item_id)
  end
  
  def shipment_params
    params.require(:shipment).permit(:order_id, :address, :post_code, :prefecture_id, :city, :block, :building, :phone).merge(order_id: @order.id)
  end

  def move_to_index
    @item = Item.find(params[:item_id])
    if current_user == @item.user
      redirect_to item_path(@item.id)
    end
  end
end
