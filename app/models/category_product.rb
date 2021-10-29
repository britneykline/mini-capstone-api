class CategoryProduct < ApplicationRecord
  belongs_to :product
  belongs_to :category  
  attribute :product_id, :integer
  attribute :category_id, :integer
end
