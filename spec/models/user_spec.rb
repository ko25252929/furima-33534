require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき'  do
     it "nicknameとemail、passwordとpassword_confirmationとが存在すれば登録できる" do
       expect(@user).to be_valid
     end
    end
    context '新規登録できないとき' do
     it "passwordが5文字以下では登録できない" do
       @user.password = "00000"
       @user.password_confirmation = "00000"
       @user.valid?
       expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
     end

     it "nicknameが空では登録できない" do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
     end
     it "emailが空では登録できない" do
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
     end    
     it "passwordが空では登録できない" do
       @user.password = ""
       @user.valid?
       expect(@user.errors.full_messages).to include("Password can't be blank")
     end
     it "重複したemailが存在する場合登録できない" do
       @user.save
       another_user = FactoryBot.build(:user)
       another_user.email = @user.email
       another_user.valid?
       expect(another_user.errors.full_messages).to include("Email has already been taken")
     end
     it "passwordが存在してもpassword_confirmationが空では登録できない" do
       @user.password_confirmation = ""
       @user.valid?
       expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
     end
     it "passwordとpassword_confirmationが不一致では登録できないこと" do
      @user.password = "123456"
      @user.password_confirmation = "1234567"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
     it "first_name(全角)が空では登録できない" do
       @user.first_name = ""
       @user.valid?
       expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it "last_name(全角)が空では登録できない" do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it "first_kana_nameがカナ(全角)空では登録できない" do
        @user.first_kana_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First kana name can't be blank")
      end
      it "last_kana_nameはカナ(全角)空では登録できない" do
        @user.last_kana_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last kana name can't be blank")
      end
      it "birthdayが空では登録できない" do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end