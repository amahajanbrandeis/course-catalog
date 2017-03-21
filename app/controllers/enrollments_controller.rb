class EnrollmentsController < ApplicationController
  before_action :set_enrollment, only: [:show, :edit, :update, :destroy]

  # GET /enrollments
  # GET /enrollments.json
  def index
    @enrollments = Enrollment.all
  end

  # GET /enrollments/1
  # GET /enrollments/1.json
  def show
  end

  # GET /enrollments/new
  def new
    @enrollment = Enrollment.new
  end

  # GET /enrollments/1/edit
  def edit
  end

  def search
    p = params
    enrollment = p[:enrollment]
    subject_id = enrollment[:subject_id]
    course = enrollment[:course]
    tc = Course.arel_table
    ts = Subject.arel_table
    if subject_id.empty?
      #@courses = Course.joins(:subjects).where("courses.name LIKE ?", "%#{course}%")
      @courses = Course.joins(:subjects).where(tc[:name].matches("%#{course}%"))
    else
      #@courses = Course.joins(:subjects).where("courses.name LIKE ? AND subjects.subject_id = ?", "%#{course}%", "#{subject_id}")
      mCourses = Course.joins(:subjects).where(tc[:name].matches("%#{course}%"))
      mSubjects = Course.joins(:subjects).where(ts[:subject_id].eq("#{subject_id}"))

      @courses = mCourses.merge(mSubjects)
    end
  end

  def destroy
    puts params
    Enrollment.where("user_id = ? AND course_id = ?", "#{params[:user_id]}", "#{params[:course_id]}").destroy_all
    redirect_to root_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_enrollment
      puts params[:id]
      if !params[:id] == "search"
        @enrollment = Enrollment.find(params[:id])
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def enrollment_params
      params.fetch(:enrollment, {})
      params.require(:enrollment).permit(:course, :subject_id)
    end
end
