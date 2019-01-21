class OrdersController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    if current_user.admin?
      @orders = Order.includes(:product).all
    else
      @orders = Order.includes(:product, :user).where(user_id: current_user.id)
    end  end

  def show
    @order = Order.find(params[:id]).to_json(:include => [{ :user => { :only => :email }}])
  end

  def new
  end

  def create
    @order = Order.create(order_params)
    respond_with @order
    session[:order_id] = @order.id
  end

  def destroy
    respond_with Order.destroy(params[:id])
    session[:order_id] = nil
  end

  protected
    def json_request?
      request.format.json?
    end

  private
  def order_params
    params.require(:order).permit(:total, :user_id)
  end
end
