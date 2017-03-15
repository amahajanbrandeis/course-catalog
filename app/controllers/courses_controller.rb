class CoursesController < ApplicationController
  def new
  end

  def show
  end

  def index
    @courses = Course.all
  end
end
