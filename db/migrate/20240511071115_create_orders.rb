class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.references :user, foreign_key: true, null: false
      t.references :item, foreign_key: true, null: false
      t.integer :prefecture_id, null: false
      t.string :postal_code,  null: false
      t.string :city, null: false
      t.string :addresses, null: false
      t.string :building
      t.string :phone_number, null: false
      t.references :order, foreign_key: true, null: true
      t.timestamps
    end
  end
end
