class Adoption < ApplicationRecord
    belongs_to :animal
    validates :animal_id, :title, presence: true
    validates :animal_id, uniqueness: true
    validates :title, length: {maximum: 40}
end
