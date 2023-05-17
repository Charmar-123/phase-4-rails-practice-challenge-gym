class Membership < ApplicationRecord
    validates :charge, presence: true
    validate :client_one_membership_with_gym

    # custom validation

    def client_one_membership_with_gym
        if client_id.present? && gym_id.present? && Membership.exists?(client_id: client_id, gym_id: gym_id)
          errors.add(:base, "A client can have only one membership with a gym")
        end
      end

    belongs_to :gym
    belongs_to :client
end
