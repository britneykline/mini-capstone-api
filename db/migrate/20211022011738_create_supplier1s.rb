class CreateSupplier1s < ActiveRecord::Migration[6.1]
  def change
    create_table :supplier1s do |t|
      t.string :name
      t.string :email
      t.string :phone_number

      t.timestamps
    end
  end
end
