require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品出品' do
    before do
      @item = FactoryBot.build(:item)
    end

    context '問題なく登録ができる場合' do
      it 'すべての情報が正しく入力されていれば登録することが出来る' do
        expect(@item).to be_valid
      end
    end
    context '問題がある場合' do
      it '商品名が空では登録することができない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it '商品の説明が空では登録することができない' do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end

      it 'カテゴリーが未選択では登録することができない' do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it '商品の状態が未選択では登録することができない' do
        @item.condition_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end

      it '配送料の負担が未選択では登録することができない' do
        @item.charge_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Charge can't be blank")
      end

      it '発送元の地域の情報が未選択では登録することができない' do
        @item.prefecture_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end

      it '発送までの日数が未選択では登録することができない' do
        @item.number_of_days_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Number of days can't be blank")
      end

      it '価格の情報が空では登録することができない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it '価格の金額が300円未満では登録することができない' do
        @item.price = '200'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is invalid')
      end

      it '価格の金額が9,999,999円を超える金額では登録することができない' do
        @item.price = '1000000000'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is invalid')
      end

      it '価格が半角数値以外の場合登録することができない' do
        @item.price = '５００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is invalid')
      end

      it '商品画像が添付されていないと登録することができない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it 'ユーザーが紐づいていないと登録することができない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
