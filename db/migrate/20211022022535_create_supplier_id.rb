class CreateSupplierId < ActiveRecord::Migration[6.1]
  def change
    create_table :supplier_ids do |t|

      t.timestamps
    end
  end
end
