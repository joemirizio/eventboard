class Poll < ActiveRecord::Base
  belongs_to :event
	has_many :choices, dependent: :destroy
end
