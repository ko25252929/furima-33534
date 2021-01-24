class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
        
  VALID_PASSWORD_REGEX =/\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i

 with_options presence: true do
  validates :nickname
  validates :first_name,format: { with: /\A[ぁ-んァ-ン一-龥]/, message: '全角文字を使用してください'} 
  validates :last_name,format: { with: /\A[ぁ-んァ-ン一-龥]/, message: '全角文字を使用してください'} 
  validates :first_kana_name,format: { with: /\A[ァ-ヶー－]+\z/, message: '全角カタカナを使用してください'} 
  validates :last_kana_name,format: { with: /\A[ァ-ヶー－]+\z/, message: '全角カタカナを使用してください'} 
  validates :birthday
  validates :password,format: { with: VALID_PASSWORD_REGEX,message: "は半角英数字混合それぞれ１文字以上含む必要があります"}

 end
end
