require 'rails_helper'

RSpec.describe OrderShipping, type: :model do
  describe '購入情報の保存' do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.create(:item)
      @order_shipping = FactoryBot.build(:order_shipping, user_id: @user.id, item_id: @item.id)
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_shipping).to be_valid
      end
      it 'buildingは空でも保存できること' do
        @order_shipping.building = ''
        expect(@order_shipping).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'postal_codeが空だと保存できないこと' do
        @order_shipping.postal_code = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @order_shipping.postal_code = 1_112_222
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include('Postal code は無効です。 ハイフン(-)を含めてください')
      end
      it 'area_idを選択していないと保存できないこと' do
        @order_shipping.area_id = 0
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Area can't be blank")
      end
      it 'cityが空だと保存できないこと' do
        @order_shipping.city = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("City can't be blank")
      end
      it 'address_lineが空だと保存できないこと' do
        @order_shipping.address_line = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Address line can't be blank")
      end
      it 'phone_numberが空だと保存できないこと' do
        @order_shipping.phone_number = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが全角を含むと保存できないこと' do
        @order_shipping.phone_number = '０８０11112222'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include('Phone number は無効です。 半角数字のみです')
      end
      it 'phone_numberが記号を含むと保存できないこと' do
        @order_shipping.phone_number = 111 - 2220 - 3330
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include('Phone number は無効です。 半角数字のみです')
      end
      it 'phone_numberが半角英字を含むと保存できないこと' do
        @order_shipping.phone_number = '111a2220a3330'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include('Phone number は無効です。 半角数字のみです')
      end
      it 'phone_numberが9桁以下だと保存できないこと' do
        @order_shipping.phone_number = 111_222_333
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include('Phone number is too short (minimum is 10 characters)')
      end
      it 'phone_numberが12桁以上だと保存できないこと' do
        @order_shipping.phone_number = 111_122_223_333
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include('Phone number is too long (maximum is 11 characters)')
      end
      it 'userが紐付いていないと保存できないこと' do
        @order_shipping.user_id = nil
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていないと保存できないこと' do
        @order_shipping.item_id = nil
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Item can't be blank")
      end
      it 'tokenが空では登録できないこと' do
        @order_shipping.token = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
