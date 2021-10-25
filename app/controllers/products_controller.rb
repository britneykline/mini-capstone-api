class ProductsController < ApplicationController
  def index
    products = Product.all
    render json: products.as_json
    products.is_discounted?
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
      inventory: params[:integer]
    )
    product.save
    #render json: product.as_json

    if product.save
      render json: { message: "Good Request" }
    else
      render json: {errors: product.errors.full_messages}
    end
  end
  
end