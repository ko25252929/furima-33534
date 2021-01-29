class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  belongs_to :category
  belongs_to :condition
  belongs_to :cost
  belongs_to :prefecture
  belongs_to :shipping_day
  has_one_attached :image
  has_one :product_purchase_history

  with_options presence: true do
    validates :name
    VALID_PRICEL_HALF = /\A[0-9]+\z/
    validates :price, presence: true, format: { with: VALID_PRICEL_HALF }, numericality: { only_integer: true,
                                                                                           greater_than: 300, less_than: 10_000_000 }
    validates :text, length: { in: 1..1000 }
    validates :image

    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :condition_id
      validates :cost_id
      validates :prefectures_id
      validates :shipping_days_id
    end
  end
end
