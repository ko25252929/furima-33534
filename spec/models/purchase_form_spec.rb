require 'rails_helper'

RSpec.describe PurchaseForm, type: :model do
  before do
    @purchaseform = FactoryBot.build(:purchase_form,user_id: user.id, user_id: user.id)
  end
  pending "add some examples to (or delete) #{__FILE__}"

  describe '購入内容情報' do
    context '購入ができるとき' do
      it 'postal_code,  prefecture_id, city, address, phone_number,token,とが存在すれば購入できる' do
        expect(@purchaseform).to be_valid
      end
    end
    context '購入ができできないとき' do
      it 'postal_codeが空では購入できない' do
        @purchaseform.postal_code = ''
        @purchaseform.valid?
        expect(@purchaseform.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'prefecture_idが空では購入できない' do
        @purchaseform.prefecture_id = ''
        @purchaseform.valid?
        expect(@purchaseform.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空では購入できない' do
        @purchaseform.city = ''
        @purchaseform.valid?
        expect(@purchaseform.errors.full_messages).to include("City can't be blank")
      end
      it 'addressが空では購入できない' do
        @purchaseform.address = ''
        @purchaseform.valid?
        expect(@purchaseform.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numberが空では購入できない' do
        @purchaseform.phone_number = ''
        @purchaseform.valid?
        expect(@purchaseform.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'tokenが空では購入できない' do
        @purchaseform.token = ''
        @purchaseform.valid?
        expect(@purchaseform.errors.full_messages).to include("Token can't be blank")
      end
      it 'user_idが空では購入できない' do
        @purchaseform.user_id = ''
        @purchaseform.valid?
        expect(@purchaseform.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空では購入できない' do
        @purchaseform.item_id = ''
        @purchaseform.valid?
        expect(@purchaseform.errors.full_messages).to include("Item can't be blank")
      end
      it 'postal_codeは半角数字でないと購入できない' do
        @purchaseform.postal_code = '１２３４５'
        @purchaseform.valid?
        expect(@purchaseform.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end
      it 'phone_numberは半角数字でないと購入できない' do
        @purchaseform.phone_number = '１２３４５'
        @purchaseform.valid?
        expect(@purchaseform.errors.full_messages).to include('Phone number 11文字以内半角数字を使用してください')
      end
      it 'phone_numberは英数混合では購入できない' do
        @purchaseform.phone_number = '123kkk'
        @purchaseform.valid?
        expect(@purchaseform.errors.full_messages).to include('Phone number 11文字以内半角数字を使用してください')
      end
      it 'prefecture_idが1では購入できない' do
        @purchaseform.prefecture_id = '1'
        @purchaseform.valid?
        expect(@purchaseform.errors.full_messages).to include('Prefecture must be other than 1')
      end
      it 'cityが全角入力でなければ購入できないこと' do
        @purchaseform.city = 'ｱｲｳｴｵ'
        @purchaseform.valid?
        expect(@purchaseform.errors.full_messages).to include('City 全角文字を使用してください')
      end
      it 'phone_numberが11文字以上では登録できない' do
        @purchaseform.phone_number = '090123456789'
        @purchaseform.valid?
        expect(@purchaseform.errors.full_messages).to include('Phone number 11文字以内半角数字を使用してください')
      end
    end
  end
end
