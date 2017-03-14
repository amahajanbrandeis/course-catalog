# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'

def delete_data
	Course.destroy_all
	Instructor.destroy_all
	Subject.destroy_all
end

def load_course_data
	json = JSON.parse(File.read('db/seeds/course.json'))

	json.each do |course|
		c = Course.create(type: course["type"], course_id: course["id"], code: course["code"], name: course["name"],
      description: course["description"], credit: course["credit"], independent_study: course["independent_study"],
      requirements: course["requirements"])
    course["subjects"].each do |subject|
      c.subjects << Subject.where(subject_id: subject["id"])
    end
	end

end

def load_instructor_data
	json = JSON.parse(File.read('db/seeds/instructor.json'))

	json.each do |instructor|
		Instructor.create(type: instructor["type"], instructor_id: instructor["id"], email: instructor["email"],
      first: instructor["first"], middle: instructor["middle"], last: instructor["last"])
	end
end


def load_subject_data
	json = JSON.parse(File.read('db/seeds/subject.json'))

	json.each do |subject|
		Subject.create(type: subject["type"], subject_id: subject["id"],  name: subject["name"],
      abbreviation: subject["abbreviation"])
	end
end

delete_data
load_instructor_data
load_subject_data
load_course_data
