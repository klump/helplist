class Entry < ActiveRecord::Base
	validates :course, format: {with: /\A[A-Z]{2}[0-9]{3}[A-Z]\Z/, message: 'is not in the right format. Use something like IT334G.'}
	validates :name, uniqueness: {scope: :course, case_sensitive: false, message: 'needs to be unique for the course (You cannot queue twice).'}
	validates :room, format: {with: /\A[A-Z][0-9]{3}\Z/, message: 'is not in the right format. Use something like D204.'}
	validates :group, inclusion: {in: 1..20, message: 'needs to be between 1 and 20.'}
	validates :demonstration, inclusion: {in: [true, false], message: 'needs to be present.'}

	before_validation :convert_fields_to_uppercase

	private
		def convert_fields_to_uppercase
			course.upcase!
			room.upcase!
		end
end
