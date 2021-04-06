class OrdersController < ApplicationController
  before_action :load_order, only: [:show, :edit, :update, :destroy]

  def index
    @orders = Order.all
  end

  def show
  end

  def new
    @order = Order.new
    @order.build_client
  end

  def edit
  end

  def create
    @order = Order.new(order_params)
    #if Client.find_by(number: @order.number).nil?
      if @order.save
        redirect_to @order
      else
        render :new
      end
    #end
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
    params.require(:order).permit(:number, :quantity, client_attributes: %i[number name postcode])
  end

  def find_client
    @cl = Client.find_by(number: @order.number)
    a=4
  end
end
