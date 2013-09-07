class Event < ActiveRecord::Base
	validates :name, presence: true
	validates :description, presence: true

	has_many :polls, dependent: :destroy
end
