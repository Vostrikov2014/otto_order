class OrdersController < ApplicationController
  before_action :load_order, only: [:show, :edit, :update, :destroy]

  def index
    @orders = Order.all
  end

  def show
    @client = @order.build_client
  end

  def new
    @order = Order.new
    @order.build_client
  end

  def edit
  end

  def create
    @order = Order.new(order_params)
    #Client.find_by_created_at(number: @order.number).nil?
    if @order.save
      redirect_to @order
    else
      render :new
    end
  end

  def update
    if @order.update(order_params)
      redirect_to @order
    else
      render :edit
    end
  end

  def destroy
    @order.destroy
    redirect_to orders_path
  end

  private

  def load_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:count, :quantity, order_product_attributes: %i[product_id quantity], client_attributes: %i[number name postcode])
  end
end
