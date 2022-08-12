class User < ApplicationRecord
    has_secure_password
    mount_uploader :photo, PhotoUploader
    
    validates :name, presence: true, uniqueness: true
end
