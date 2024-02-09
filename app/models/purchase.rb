class Purchase < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :group_purchases, dependent: :destroy
  has_many :groups, through: :group_purchases

  accepts_nested_attributes_for :group_purchases, allow_destroy: true

  validates :name, presence: true, length: { maximum: 36 }
  validates :amount, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates_associated :group_purchases
end
