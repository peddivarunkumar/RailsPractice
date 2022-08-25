class User < ApplicationRecord
    has_secure_password

    has_many :articles, dependent: :destroy
    has_many :bookings, dependent: :destroy
    has_many :events, through: :bookings, dependent: :destroy
    has_one :picture, as: :imageable, dependent: :destroy
    has_many :comments, dependent: :destroy

    accepts_nested_attributes_for :picture, update_only: true

    validates :name, presence: true, uniqueness: true

end
