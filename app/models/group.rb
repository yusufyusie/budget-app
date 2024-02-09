class Group < ApplicationRecord
  belongs_to :user
  has_many :group_purchases, dependent: :destroy
  has_many :purchases, through: :group_purchases

  validates :name, presence: true, length: { maximum: 36 },
                   uniqueness: { scope: :user, message: 'user already has this group' }
  validates :icon, presence: true, length: { maximum: 250 }
end
