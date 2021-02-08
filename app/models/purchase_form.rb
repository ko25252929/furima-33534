class PurchaseForm
  include ActiveModel::Model
  
  attr_accessor :postal_code, :prefecture_id, :city, :address, :building_name, :phone_number, :user_id, :item_id, :token

  # ここにバリデーションの処理を書く
  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: "is invalid. Include hyphen(-)" }
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :city, format: { with: /\A[ぁ-んァ-ン一-龥々]/, message: '全角文字を使用してください' }
    validates :address
    validates :phone_number, format: { with: /\A\d{11}\z/, message: '11文字以内半角数字を使用してください' }
    validates :token
  end

  def save
    product_purchase_history = ProductPurchaseHistory.create(user_id: user_id, item_id: item_id)
    Buy.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, building_name: building_name, phone_number: phone_number, product_purchase_history_id: product_purchase_history.id)
    
    # 各テーブルにデータを保存する処理を書く
  end
end