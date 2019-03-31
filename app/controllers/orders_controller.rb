# frozen_string_literal: true

class OrdersController < ApplicationController
  before_action :authenticate_user!
  def index
    @orders = if current_user.admin?
                Order.includes(:product).all
              else
                Order.includes(:product, :user).where(user_id: current_user.id)
              end
  end

  def show
    @order = Order.find(params[:id])
  end

  def new; end

  def create; end

  def destroy; end
end
