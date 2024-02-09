class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

    has_many :purchases, foreign_key: 'author_id', dependent: :destroy
    has_many :groups, dependent: :destroy

    validates :name, presence: true, length: { maximum: 35 }
end
