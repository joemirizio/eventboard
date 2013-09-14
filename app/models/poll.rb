class Poll < ActiveRecord::Base
	validates :question, presence: true

  belongs_to :event
	has_many :choices, dependent: :destroy
end
