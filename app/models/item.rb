class Item < ApplicationRecord
  belongs_to :user
  has_one :product_purchase_history


  with_options presence: true do
    validates :name
    validates :price
    validates :text
    validates :category_id
    validates :condition_id 
    validates :cost_id
    validates :prefectures_id
    validates :shipping_days_id
    validates :image
  end
end
