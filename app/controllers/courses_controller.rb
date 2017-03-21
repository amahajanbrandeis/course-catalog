class CoursesController < ApplicationController
  def new
  end

  def show
  end

  def index
    @courses = Course.all.order('code ASC')
  end

  def enroll
    if !is_enrolled
      @enrollment = Enrollment.new
      @enrollment.user_id = params[:user_id]
      @enrollment.course_id = params[:course_id]
      @enrollment.enrollment_date = Time.now
      if @enrollment.save
        flash[:notice] = "Enrollment Successful!"
        redirect_to enrollments_search_path
      end
    else
      flash[:notice] = "Already Enrolled!"
      redirect_to enrollments_search_path
    end
  end

  def is_enrolled
    user_id = params[:user_id]
    course_id = params[:course_id]
    enrolledCourses = Course.joins(:enrollments).where("enrollments.user_id = ? AND enrollments.course_id = ?", "#{user_id}", "#{course_id}")
    return enrolledCourses.length > 0
  end

end
