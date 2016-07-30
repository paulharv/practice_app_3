class Appointment < ApplicationRecord
	validates :vet_id, presence:true
	validates :pet_id, presence:true
	validates :when, presence:true

	belongs_to :pet
	belongs_to :vet
end
