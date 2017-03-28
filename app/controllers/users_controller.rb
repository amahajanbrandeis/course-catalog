class UsersController < ApplicationController
  def new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Account Creation Successful!"
      redirect_to root_url
    else
      render 'new'
    end
  end

  def show
    p = params
    @user = User.find(params[:id])
    @loggedUser = User.find_by(id: session[:user_id])
    if @loggedUser.nil?
      redirect_to root_url
    elsif @user.id != @loggedUser.id
      redirect_to root_url
    else
      @enrolledCourses = Course.joins(:enrollments).where("enrollments.user_id = ?", "#{@user.id}").order('code ASC')
    end
  end


  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

end
