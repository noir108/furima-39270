class OrdersController < ApplicationController
  def index
    @Order_shipping = OrderShipping.new
  end
  
end
