class OrdersController < ApplicationController
  ###index
  def index
    orders = Order.all
    render json: orders.as_json
  end 

  ###show
  def show
    order = Order.find(params[:id])
    render json: order.as_json
  end

  ###create
  def create
    order = Order.new(
      user_id: params[:user_id],
      product_id: params[:product_id],
      quantity: params[:quantity],
      subtotal: params[:subtotal],
      tax: params[:tax],
      total: params[:total]
    )
    order.save
    if order.save
      render json: { message: "Order created successfully" }
    else
      render json: { message: "Order not successful", errors: order.errors } 
    end
  end 

  ###update
  def update  
    order = Order.find(params[:id])
    if order
      order.update(order_params)
      render json: { message: "Order updated successfully" }
    else
      render json: { message: "Order not updated successfully", errors: order.errors } 
    end
  end

end
