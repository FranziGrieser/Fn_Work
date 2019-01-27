class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    if current_user.admin?
      @orders = Order.includes(:order_items).all
    else
      @orders = Order.includes(:order_items, :user).where(user_id: current_user.id)
    end  end

  def show
    @order = Order.find(params[:id])
  end

  def new
  end

  def create
  end

  def destroy
  end
end
