class Animal < ApplicationRecord
    has_one :adoption
    belongs_to :user_pet_care
    validates :name, :age, :city, presence: true
    has_one_attached :image, :dependent => :destroy
end
