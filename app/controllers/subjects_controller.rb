class SubjectsController < ApplicationController
  def new
  end

  def show
  end

  def index
    @subjects = Subject.all
  end
end
