class Product < ApplicationRecord
  validates :name, presence: true
  validates :price, numericality: {minimum: 0}
  validates :description, length: {maximum: 500}
  validates :name, uniqueness: true
  belongs_to :Supplier1
  has_many :orders
  has_many :photos
  has_many :category_products
  has_many :categories, through: :category_products
 
  def is_discounted?
    if price < 10
      return true
    else
      return false
    end
  end 

  def tax
    price * 0.09
  end 

  def total
    price + tax
  end 
end
