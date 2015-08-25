class Comment < ActiveRecord::Base
  def self.for_course(course=:all)
    if course = :all
      Comment.all
    else
      Comment.where(course: [nil, course])
    end
  end
end
