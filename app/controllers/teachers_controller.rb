class TeachersController < ApplicationController
  def index
    @teachers = Teacher.all
  end

  def show
    @teacher = Teacher.find(params[:id])
  end

  def new
    @teacher = Teacher.new
  end

  def create
    @teacher = Teacher.new(teacher_params)
    @teacher.user = current_user
    if @teacher.save
      redirect_to user_teacher_path(current_user, @teacher), notice: 'Teacher profile was successfully created!'
    else
      render :new
    end
  end

  def edit
    @teacher = Teacher.find(params[:id])
  end

  def update
    @teacher = Teacher.find(params[:id])
    if @teacher.update(teacher_params)
      redirect_to user_teacher_path(current_user, @teacher)
    else
      render :edit
    end
  end

  def destroy
    @teacher = Teacher.find(params[:id])
    @teacher.destroy
    redirect_to root_path
  end

  private

  def teacher_params
    params.require(:teacher).permit(:user_id, :first_name, :last_name, :age, :description, :gender, :photo, :city, :zip)
  end
end
