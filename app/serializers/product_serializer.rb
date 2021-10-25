class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :price, images, :description, :supplier
end
