class CoursesController < ApplicationController
  def new
  end

  def show
  end

  def index
    @courses = Course.all
  end

  def enroll
    @enrollment = Enrollment.new
    @enrollment.user_id = params[:user_id]
    @enrollment.course_id = params[:course_id]
    @enrollment.enrollment_date = Time.now
    @enrollment.save
    puts params[:course_id]
  end

end
