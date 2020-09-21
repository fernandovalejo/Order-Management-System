class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update]
  
  def index
    @q = Order.includes(:status).ransack params[:q]
    @pagy, @orders = pagy(@q.result, items: 10)
  end
  
  def show; end
  
  def new
    @order = Order.new
  end
  
  def edit; end
  
  def create
    @order = Order.new(order_params)
    
    if @order.save
      redirect_to @order, notice: 'Order was successfully created.'
    else
      render :new
    end
  end
  
  def update
    if @order.update(order_params)
      redirect_to @order, notice: 'Order was successfully updated.'
    else
      render :edit
    end
  end
  
  
  private
  
  def set_order
    @order = Order.find(params[:id])
    redirect_to orders_path, notice:'Order concluded!' if @order.status_id == 3
  end
  
  def order_params
    params.require(:order).permit(:status_id, :description)
  end
end
