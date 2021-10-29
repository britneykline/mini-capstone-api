class ProductsController < ApplicationController
  #before_action :authentication_admin, only: [:create, :update, :destroy]

  def index
    products = Product.all
    render json: products.as_json
  end

  def show
    id = params[:id]
    product = Product.find_by(id: id)
    render json: product.as_json
  end 

  def create
    product = Product.new(
      name: params[:name],
      price: params[:price],
      image_url: params[:image_url],
      description: params[:description],
      supplier_id: params[:supplier_id],
      inventory: params[:integer]
    )
    product.save
    #render json: product.as_json

    if product.save
      render json: { message: "Product created successfully" }
    else
      render json: {errors: product.errors.full_messages}, status: unprocessable_entity
    end
  end
  
  
end