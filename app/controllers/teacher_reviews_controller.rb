class TeacherReviewsController < ApplicationController
  def index
    @teacher_reviews = TeacherReview.all
  end

  def show
    @teacher_review = TeacherReview.find(params[:id])
  end

  def new
    @teacher = Teacher.find(params[:teacher_id])
    @user = current_user
    @teacher_review = TeacherReview.new
  end

  def create
    @user = current_user
    @teacher = Teacher.find(params[:teacher_id])
    @teacher_review = TeacherReview.new(teacher_reviews_params)
    @teacher_review.teacher = @teacher
    @teacher_review.user = @user
    if @teacher_review.save
      redirect_to user_teacher_path(current_user, @teacher)
    else
      render :new
    end
  end

  def edit
    @user = current_user
    @teacher = Teacher.find(params[:teacher_id])
    @teacher_review = TeacherReview.find(params[:id])
  end

  def update
    @teacher_review = TeacherReview.find(params[:id])
    @teacher = Teacher.find(params[:teacher_id])
    if @teacher_review.update(teacher_reviews_params)
      redirect_to user_teacher_path(current_user, @teacher)
    else
      render :edit
    end
  end

  def destroy
    @teacher_review = TeacherReview.find(params[:id])
    @teacher = Teacher.find(params[:teacher_id])
    if @teacher_review.destroy
      redirect_to user_teacher_path(current_user, @teacher)
    end
  end

  def teacher_reviews_params
    params.require(:teacher_review).permit(:user_id, :teacher_id, :rating, :comment)
  end
end
