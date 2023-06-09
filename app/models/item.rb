class Item < ApplicationRecord
  with_options presence: true do
    validates :name, :content, :price, :image
  end
  with_options numericality: { other_than: 0, message: 'を入力してください' } do
    validates :category_id, :status_id, :shipping_fee_id, :area_id, :lead_time_id
  end
  validates :price, numericality: { only_integer: true, message: 'は無効です。 半角数字を入力してください' }
  validates :price, inclusion: { in: 300..9_999_999, message: 'が設定範囲外です' }

  belongs_to :user
  has_one_attached :image
  has_one :order

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shipping_fee, class_name: 'ShippingFee'
  belongs_to :area
  belongs_to :lead_time, class_name: 'LeadTime'
end
