class User < ApplicationRecord
    has_secure_password
    mount_uploader :photo, PhotoUploader

    has_many :articles, dependent: :destroy

    validates :name, presence: true, uniqueness: true
end
