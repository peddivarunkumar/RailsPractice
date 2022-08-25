class Event < ApplicationRecord
    has_many :bookings
    has_many :users, through: :bookings
    has_one :picture, as: :imageable
    accepts_nested_attributes_for :picture, update_only: true
end
