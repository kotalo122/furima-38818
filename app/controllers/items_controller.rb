class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy,]

  def index

  end

  def new
    @item = Item.new
  end

  def create
    
  end

  # private
  # def item_params
  #   params.require(:item).permit(:image, :text).merge(user_id: current_user.id)
  # end

end
