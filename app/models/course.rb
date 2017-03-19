class Course < ApplicationRecord
  has_and_belongs_to_many :subjects, join_table: :courses_subjects
  has_many :enrollments
  has_many :users, through: :enrollments

  def is_enrolled(user_id, course_id)
    enrolledCourses = Course.joins(:enrollments).where("enrollments.user_id = ? AND enrollments.course_id = ?", "#{user_id}", "#{course_id}")
    return enrolledCourses.length > 0
  end
end
