class User < ApplicationRecord
    has_secure_password
    mount_uploader :photo, PhotoUploader

    has_many :articles, dependent: :destroy
    has_many :bookings
    has_many :events, through: :bookings

    validates :name, presence: true, uniqueness: true

end
