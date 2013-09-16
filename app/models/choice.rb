class Choice < ActiveRecord::Base
	validates :name, presence: true

  belongs_to :poll
	before_save :default_values

	def vote
		self.votes += 1
	end

private
	def default_values
		self.votes ||= 0
	end

end
