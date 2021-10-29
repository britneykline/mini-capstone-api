class DebuggingTableIssues < ActiveRecord::Migration[6.1]
  def change
    add_column :categories, :name, :string
  end
  def change
    add_column :images, :product_id, :integer
  end
  def change
    add_column :images, :url, :string
  end
  def change
    add_column :suppliers, :name, :string
  end
  def change
    add_column :suppliers, :phone, :string
  end  
  def change
    add_column :suppliers, :email, :string
  end
end
