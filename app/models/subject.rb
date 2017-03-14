class Subject < ApplicationRecord
  has_many_and_belongs_to :courses
end
