class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :cost
  belongs_to :area
  belongs_to :days
  belongs_to :user
  has_one_attached :image

  validates :category_id, numericality: { other_than: 1, message: "can't be blank" } 
  validates :status_id, numericality: { other_than: 1, message: "can't be blank" } 
  validates :cost_id, numericality: { other_than: 1, message: "can't be blank" } 
  validates :area_id, numericality: { other_than: 0, message: "can't be blank" } 
  validates :days_id, numericality: { other_than: 1, message: "can't be blank" } 

  with_options presence: true do
    validates :name
    validates :description
    validates :image
    validates :price, numericality: { only_integer: true,
       greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  end
  
end
