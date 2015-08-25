class Entry < ActiveRecord::Base
  validates :course, format: {with: /\A[A-Z]{2}[0-9]{3}[A-Z]\Z/, message: 'is not in the right format. Use something like IT334G.'}
  validates :name, uniqueness: {scope: [:course, :closed_at], case_sensitive: false, message: 'needs to be unique for the course (You cannot queue twice).'}, presence: true
  validates :room, format: {with: /\A[A-Z][0-9]{3}\Z/, message: 'is not in the right format. Use something like D204.'}
  validates :group, inclusion: {in: 1..20, message: 'needs to be between 1 and 20.'}
  validates :demonstration, inclusion: {in: [true, false], message: 'needs to be present.'}

  before_validation :convert_fields_to_uppercase

  def self.course(coursecode)
    where(course: coursecode)
  end

  def self.open
    where("entries.closed_at IS NULL" )
  end

  def self.closed
    where("entries.closed_at IS NOT NULL" )
  end

  def close
    self.closed_at = Time.now
    self.save
  end

  private
    def convert_fields_to_uppercase
      course.upcase!
      room.upcase!
    end
end
