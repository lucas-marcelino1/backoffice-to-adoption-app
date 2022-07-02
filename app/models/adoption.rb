class Adoption < ApplicationRecord
    belongs_to :animal
    belongs_to :user_pet_care
    validates :title, presence: true
    validates :animal, uniqueness: true
    validates :title, length: {maximum: 40}
end
