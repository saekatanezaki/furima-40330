class CreateShippingStatuses < ActiveRecord::Migration[7.0]
  def change
    create_table :shipping_statuses do |t|

      t.timestamps
    end
  end
end
