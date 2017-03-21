class SubjectsController < ApplicationController
  def new
  end

  def show
  end

  def index
    @subjects = Subject.all.order('name ASC')
  end
end
