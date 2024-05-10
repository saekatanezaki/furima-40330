class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :item_name, null: false
      t.text :content, null: false
      t.integer :price, null: false
      t.integer :genre_id, null: false
      t.integer :status_id, null: false
      t.integer :shipping_status_id, null: false
      t.integer :prefecture_id, null: false
      t.integer :scheduled_delivery_id, null: false
      t.references :user, foreign_key: true, null: false
      t.timestamps
    end
  end
end
