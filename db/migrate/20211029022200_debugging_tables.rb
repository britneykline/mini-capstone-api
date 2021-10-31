class DebuggingTables < ActiveRecord::Migration[6.1]
  def change
    add_column :categories, :name, :string
    add_column :images, :product_id, :integer
    add_column :images, :url, :string
    add_column :suppliers, :name, :string
    add_column :suppliers, :phone, :string
  end
end
