class Break < ActiveRecord::Base
	validate :check_single

	private
	def check_single
		if Break.any?
			errors.add(:base, 'There can only be one break at a time.')
		end
	end
end
