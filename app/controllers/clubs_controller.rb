class ClubsController < ApplicationController
  def index
    @clubs = Club.all
  end

  def show
    @club = Club.find(params[:id])
    @fields = Field.all
  end

  def new
    @club = Club.new
  end

  def create
    @club = Club.new(club_params)
    @club.user = current_user
    if @club.save
      redirect_to user_club_path(current_user, @club), notice: 'Club was successfully created!'
    else
      render :new
    end
  end

  def edit
    @club = Club.find(params[:id])
  end

  def update
    @club = Club.find(params[:id])
    if @club.update(club_params)
      redirect_to user_club_path(current_user, @club)
    else
      render :edit
    end
  end

  def destroy
    @club = Club.find(params[:id])
    @club.destroy
    redirect_to root_path
  end

  def club_params
    params.require(:club).permit(:user_id, :name, :street, :street_number, :city, :zip, :description, :photo)
  end
end

