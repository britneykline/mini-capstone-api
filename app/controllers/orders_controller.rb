class OrdersController < ApplicationController
  before_action: authenticate_user
  
  ###index
  def index
    orders = Order.where(user_id: current_user.id)
    render json: orders.as_json
  end 

  ###show
  def show
    order = Order.find(params[:id])
    render json: order.as_json
  end

  ###create
  def create
    product = Product.find_by(id: params[:product_id])
    calculated_subtotal = params[:quantity].to_i * product.price
    tax_rate = 0.07
    calculated_tax = calculated_subtotal * tax_rate
    calculated_total = calculated_tax + calculated_subtotal
    
    order = Order.new(
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params[:quantity],
      subtotal: calculated_subtotal,
      tax: calculated_tax,
      total: calculated_total
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

  def authenticate_user 
    unless current_user
      render json: { message: "Must be logged in for this action"}, status: :unauthorized
    end
  end

  def authenticate_user 
    unless current_user.admin
      render json: { message: "Must be logged in for this action"}, status: :unauthorized
    end
  end

end
