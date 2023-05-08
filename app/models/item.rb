class Item < ApplicationRecord


  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shipping_fee, class_name: "ShippingFee"
  belongs_to :area
  belongs_to :lead_time, class_name: "LeadTime"

end