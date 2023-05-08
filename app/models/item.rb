class Item < ApplicationRecord


  with_options presence: true do
    validates :name, :content, :price, :image
  end
  with_options numericality: { other_than: 1 , message: "can't be blank"} do
  validates :category_id, :status_id, :shipping_fee_id, :area_id, :lead_time_id
  end

  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shipping_fee, class_name: "ShippingFee"
  belongs_to :area
  belongs_to :lead_time, class_name: "LeadTime"

end
