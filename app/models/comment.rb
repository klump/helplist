class Comment < ActiveRecord::Base
  before_save :fix_course

  validate :course_is_nil_or_has_format
  validates :message, presence: true, uniqueness: { scope: :course }
  validates :signature, presence: true

  def self.for_course(course=:all)
    if course == :all
      Comment.all
    else
      Comment.where(course: [nil, course])
    end
  end

  private
    def fix_course
      if self.course.nil? || self.course.empty?
        self.course = nil
      else
        self.course.upcase!
      end
    end

    def course_is_nil_or_has_format
      unless ( course.nil? || course.empty? || ( course =~ /^\w{2}\d{3}\w$/ ) )
        errors.add :base, "Course needs to be empty or an official course code"
      end
    end
end
