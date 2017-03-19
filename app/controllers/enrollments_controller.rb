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

  # POST /enrollments
  # POST /enrollments.json
  def create
    @enrollment = Enrollment.new(enrollment_params)

    respond_to do |format|
      if @enrollment.save
        format.html { redirect_to @enrollment, notice: 'Enrollment was successfully created.' }
        format.json { render :show, status: :created, location: @enrollment }
      else
        format.html { render :new }
        format.json { render json: @enrollment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /enrollments/1
  # PATCH/PUT /enrollments/1.json
  def update
    respond_to do |format|
      if @enrollment.update(enrollment_params)
        format.html { redirect_to @enrollment, notice: 'Enrollment was successfully updated.' }
        format.json { render :show, status: :ok, location: @enrollment }
      else
        format.html { render :edit }
        format.json { render json: @enrollment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /enrollments/1
  # DELETE /enrollments/1.json
  def destroy
    @enrollment.destroy
    respond_to do |format|
      format.html { redirect_to enrollments_url, notice: 'Enrollment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def search
    p = params
    enrollment = p[:enrollment]
    subject_id = enrollment[:subject_id]
    course = enrollment[:course]
    if subject_id.empty?
      @courses = Course.joins(:subjects).where("courses.name LIKE ?", "%#{course}%")
    else
      @courses = Course.joins(:subjects).where("courses.name LIKE ? AND subjects.subject_id = ?", "%#{course}%", "#{subject_id}")
    end
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
