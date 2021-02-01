class Buy < ApplicationRecord
  belongs_to :Product_purchase_history

  with_options presence: true do
    validates :postal_code
    validates :prefecture_id
    validates :city
    validates :address
    validates :phone_number
  end
  validates :building_name
end
