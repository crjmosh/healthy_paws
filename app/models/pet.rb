class Pet < ApplicationRecord
	has_attachment :picture, accept: [:jpg, :png, :gif]

	belongs_to :user
	has_many :appointments, dependent: :destroy
	has_many :medicals, dependent: :destroy

	validates_presence_of :name, :species
	validates_inclusion_of :gender, in: %w(male female)
end
