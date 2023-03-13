class OrdersController < ApplicationController

    before_action :user_admin?, except: %i[index]
    def index
        @orders = Order.all
    end
  
    def new
      @order = Order.new
      @products = Product.all
    end
  
    def create
      @order = Order.new(order_params)
    
  
      if @order.save
        redirect_to all_orders_path
      else
        @products = product.all
        render :new, status: :unprocessable_entity
      end
    end
  
    def edit
      @order = Order.find(params[:id])
      @products = Product.all
    end
  
    def update
      @order = Order.find(params[:id])
      if @order.update(order_params)
        redirect_to all_orders_path
      else
        @products = product.all
        render :edit, status: :unprocessable_entity
      end
    end
  
    def destroy
      order = Order.find(params[:id])  
      order.destroy
      redirect_to all_orders_path
    end
  
    private
  
    def order_params
      params.require(:order).permit(:product_id, :quantity, :customer_id)
    end
  end
  