class Choice < ActiveRecord::Base
  belongs_to :poll
	before_save :default_values

private
	def default_values
		self.votes ||= 0
	end

end
