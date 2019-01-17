class PlayerReviewsController < ApplicationController
  def index
    @player_reviews = PlayerReview.all
  end

  def show
    @player_review = PlayerReview.find(params[:id])
  end

  def new
    @player = Player.find(params[:player_id])
    @user = current_user
    @player_review = PlayerReview.new
  end

  def create
    @user = current_user
    @player = Player.find(params[:player_id])
    @player_review = PlayerReview.new(player_reviews_params)
    @player_review.player = @player
    @player_review.user = @user
    if @player_review.save
      redirect_to user_player_path(current_user, @player)
    else
      render :new
    end
  end

  def edit
    @user = current_user
    @player = Player.find(params[:player_id])
    @player_review = PlayerReview.find(params[:id])
  end

  def update
    @player = Player.find(params[:player_id])
    @player_review = PlayerReview.find(params[:id])
    if @player_review.update(player_reviews_params)
      redirect_to user_player_path(current_user, @player)
    else
      render :edit
    end
  end

  def destroy
  end

  private

  def player_reviews_params
    params.require(:player_review).permit(:rating, :comment, :user_id, :player_id)
  end
end
