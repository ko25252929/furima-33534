class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :birthday
    
    VALID_PASSWORD_REGEX =/\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i
    validates :password,format: { with: VALID_PASSWORD_REGEX,message: "は半角英数字混合それぞれ１文字以上含む必要があります"}

    with_options format: { with: /\A[ぁ-んァ-ン一-龥々]/, message: '全角文字を使用してください'}  do
      validates :first_name
      validates :last_name
    end
    
    with_options format: { with: /\A[ァ-ヶー－]+\z/, message: '全角カタカナを使用してください'}  do
      validates :first_kana_name
      validates :last_kana_name
    end
  end
end
