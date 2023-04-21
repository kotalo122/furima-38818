class OrdersController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :set_item, only: [:index, :create]
  before_action :move_to_index, only: [:index, :create]

  def index
    @order_shipment = OrderShipment.new
  end

  def create
    @order_shipment = OrderShipment.new(order_params)
    if @order_shipment.valid?
       @order_shipment.save
       redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_shipment).permit(:address, :post_code, :prefecture_id, :city, :block, :building, :phone).merge(user_id: current_user.id, item_id: @item.id )
  end
  
  def set_item
    @item = Item.find(params[:item_id])
  end

  def move_to_index
    if current_user == @item.user
      redirect_to item_path(@item.id)
    end
  end
end
