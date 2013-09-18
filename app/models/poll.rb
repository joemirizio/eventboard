class Poll < ActiveRecord::Base
	validates :question, presence: true

  belongs_to :event
	has_many :choices, dependent: :destroy

  def as_json(options={}) 
		super(options.merge(include: [:choices]))
	end

end
