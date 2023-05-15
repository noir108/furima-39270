class CreateShippings < ActiveRecord::Migration[6.0]
  def change
    create_table :shippings do |t|
      t.string :postal_code,  null: false
      t.integer :area_id,     null: false
      t.string :city,         null: false
      t.string :address_line, null: false
      t.string :building,     null: true
      t.string :phone_number, null: false
      t.references :order,    null: false, foreign_key: true
      t.timestamps
    end
  end
end
