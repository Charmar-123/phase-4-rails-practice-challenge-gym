class Gym < ApplicationRecord
    validates :name, presence: true
    validates :address, presence: true

    has_many :memberships
end
