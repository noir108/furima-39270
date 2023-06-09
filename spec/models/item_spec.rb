require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品新規登録' do
    context '新規登録できる場合' do
      it 'nameとcontentとpriceとimage、category_id、status_id、shipping_fee_id、area_id、lead_time_idが存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end
    context '新規登録できない場合' do
      it 'nameが空では登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'contentが空では登録できない' do
        @item.content = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Content can't be blank")
      end
      it 'imageが空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'category_idが空では登録できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Category を入力してください')
      end
      it 'category_idが初期値(---)だと登録できない' do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Category を入力してください')
      end
      it 'status_idが空では登録できない' do
        @item.status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Status を入力してください')
      end
      it 'status_idが初期値(---)だと登録できない' do
        @item.status_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Status を入力してください')
      end
      it 'shipping_fee_idが空では登録できない' do
        @item.shipping_fee_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping fee を入力してください')
      end
      it 'shipping_fee_idが初期値(---)だと登録できない' do
        @item.shipping_fee_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping fee を入力してください')
      end
      it 'area_idが空では登録できない' do
        @item.area_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Area を入力してください')
      end
      it 'area_idが初期値(---)だと登録できない' do
        @item.area_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Area を入力してください')
      end
      it 'lead_time_idが空では登録できない' do
        @item.lead_time_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Lead time を入力してください')
      end
      it 'lead_time_idが初期値(---)だと登録できない' do
        @item.lead_time_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Lead time を入力してください')
      end
      it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが300未満だと登録できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price が設定範囲外です')
      end
      it 'priceが9,999,999以上だと登録できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price が設定範囲外です')
      end
      it 'priceが全角の場合は登録できない' do
        @item.price = '５００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price は無効です。 半角数字を入力してください',
                                                      'Price が設定範囲外です')
      end
      it 'priceが半角英字の場合は登録できない' do
        @item.price = 'aaa'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price は無効です。 半角数字を入力してください',
                                                      'Price が設定範囲外です')
      end
      it 'userが紐付いていないと保存できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
