class OrdersController < ApplicationController
  before_action :set_item, only: [:index, :create]
  before_action :authenticate_user!, only: [:index, :create]
  before_action :move_to_index, only: [:index, :create]

  def index
    @order_shipping = OrderShipping.new
  end
  
  def create
    @order_shipping = OrderShipping.new(order_params)
    if @order_shipping.valid?
      @order_shipping.save
      redirect_to root_path
    else
      render :index
    end
  end
  
  private

def set_item
  @item = Item.includes(:user).find(params[:item_id])
end

  def order_params
    params.require(:order_shipping).permit(:postal_code, :area_id, :city, :address_line, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def move_to_index
    return if current_user.id != @item.user_id
    redirect_to root_path
  end
end
