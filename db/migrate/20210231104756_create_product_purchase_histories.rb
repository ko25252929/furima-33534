class CreateProductPurchaseHistories < ActiveRecord::Migration[6.0]
  def change
    create_table :product_purchase_histories do |t|
      t.references   :user , null: false, foreingn_key: true
      t.references   :item , null: false, foreingn_key: true

      t.timestamps
    end
  end
end
