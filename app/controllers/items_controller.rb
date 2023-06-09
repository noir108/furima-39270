class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :show, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :edit, :destroy]
  before_action :move_to_index, only: [:edit]

  def index
    @items = Item.all.order('created_at DESC')
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
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  def destroy
    return unless current_user.id == @item.user.id

    @item.destroy
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:name, :content, :price, :category_id, :status_id, :shipping_fee_id, :area_id, :lead_time_id,
                                 :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.includes(:user).find(params[:id])
  end

  def move_to_index
    return unless current_user.id != @item.user.id || Order.exists?(item_id: @item.id)

    redirect_to root_path
  end
end
