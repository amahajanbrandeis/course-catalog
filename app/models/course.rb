class Course < ApplicationRecord
  has_and_belongs_to_many :subjects, join_table: :courses_subjects
  has_many :enrollments
  has_many :users, through: :enrollments
end
