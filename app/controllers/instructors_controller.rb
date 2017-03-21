class InstructorsController < ApplicationController
  def new
  end

  def show
  end

  def index
    @instructors = Instructor.all.order('last ASC')
  end
end
