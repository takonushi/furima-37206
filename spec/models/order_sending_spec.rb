require 'rails_helper'

RSpec.describe OrderSending, type: :model do
  describe '購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order_sending = FactoryBot.build(:order_sending, user_id: user.id, item_id: item.id)
      sleep(0.1)
    end

    context '内容に問題がない場合' do
      it 'すべての情報が正しく入力されていれば保存できること' do
        expect(@order_sending).to be_valid
      end
      
      it 'building_nameは空欄でも登録することができる' do
        @order_sending.building_name = ""
        expect(@order_sending).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it '郵便番号が空では登録ができない' do
        @order_sending.postal_code = ""
        @order_sending.valid?
        expect(@order_sending.errors.full_messages).to include("Postal code can't be blank")
      end

      it '郵便番号に(-)がないと登録ができない' do
        @order_sending.postal_code = "1234567"
        @order_sending.valid?
        expect(@order_sending.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end

      it '都道府県情報が未選択では登録することができない' do
        @order_sending.prefecture_id = 0
        @order_sending.valid?
        expect(@order_sending.errors.full_messages).to include("Prefecture can't be blank")
      end

      it '市区町村(city)が空では登録することができない' do
        @order_sending.city = ""
        @order_sending.valid?
        expect(@order_sending.errors.full_messages).to include("City can't be blank")
      end

      it '番地(house_number)が空では登録することができない' do
        @order_sending.house_number = ""
        @order_sending.valid?
        expect(@order_sending.errors.full_messages).to include("House number can't be blank")
      end

      it '電話番号(telephone_number)が空では登録することができない' do
        @order_sending.telephone_number = ""
        @order_sending.valid?
        expect(@order_sending.errors.full_messages).to include("Telephone number can't be blank")
      end

      it '電話番号の桁数が10桁以上、11桁以内の半角数値以外では登録ができない' do
        @order_sending.telephone_number = "080-1111-2222"
        @order_sending.valid?
        expect(@order_sending.errors.full_messages).to include("Telephone number is invalid. Telephone number must be 10 or 11 single-byte numbers")
        
      end

      it 'userが紐づいていないと登録ができない' do
        @order_sending.user_id = nil
        @order_sending.valid?
        expect(@order_sending.errors.full_messages).to include("User can't be blank")
      end

      it 'itemが紐づいていないと登録ができない' do
        @order_sending.item_id = nil
        @order_sending.valid?
        expect(@order_sending.errors.full_messages).to include("Item can't be blank")
      end

      it 'token情報が空では登録ができない' do
        @order_sending.token = nil
        @order_sending.valid?
        expect(@order_sending.errors.full_messages).to include("Token can't be blank")

      end
    end
  end
end