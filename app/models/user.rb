class User < ApplicationRecord
    has_secure_password

    has_many :articles, dependent: :destroy
    has_many :bookings
    has_many :events, through: :bookings
    has_one :picture, as: :imageable

    accepts_nested_attributes_for :picture, update_only: true

    validates :name, presence: true, uniqueness: true

end
