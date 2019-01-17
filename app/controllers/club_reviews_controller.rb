class ClubReviewsController < ApplicationController
  def index
    @club_reviews = ClubReview.all
  end

  def show
    @club_review = ClubReview.find(params[:id])
  end

  def new
    @club = Club.find(params[:club_id])
    @user = current_user
    @club_review = ClubReview.new
  end

  def create
    @user = current_user
    @club = Club.find(params[:club_id])
    @club_review = ClubReview.new(club_reviews_params)
    @club_review.club = @club
    @club_review.user = @user
    if @club_review.save
      redirect_to user_club_path(current_user, @club)
    else
      render :new
    end
  end

  def edit
    @user = current_user
    @club = Club.find(params[:club_id])
    @club_review = ClubReview.find(params[:id])
  end

  def update
    @club_review = ClubReview.find(params[:id])
    @club = Club.find(params[:club_id])
    if @club_review.update(club_reviews_params)
      redirect_to user_club_path(current_user, @club)
    else
      render :edit
    end
  end

  def destroy
    @club_review = ClubReview.find(params[:id])
    @club = Club.find(params[:club_id])
    if @club_review.destroy
      redirect_to user_club_path(current_user, @club)
    end
  end

  def club_reviews_params
    params.require(:club_review).permit(:user_id, :club_id, :rating, :comment)
  end
end

end
