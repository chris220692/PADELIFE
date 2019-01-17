class FieldsController < ApplicationController
  def index
    @fields = Field.all
  end

  def show
    @club = Club.find(params[:club_id])
    @fields = Field.find(params[:id])
  end

  def new
    @club = Club.find(params[:club_id])
    @field = Field.new
  end

  def create
    @club = Club.find(params[:club_id])
    @field = Field.new(field_params)
    @field.club = @club
    if @field.save
      redirect_to user_club_path(current_user, @club)
    else
      render :new
    end
  end


  def edit
    @field = Field.find(params[:id])
    @club = Club.find(params[:club_id])
  end

  def update
    @club = Club.find(params[:club_id])
    @field = Field.find(params[:id])
    @field.update(field_params)
    redirect_to user_club_path(current_user, @club)
  end

  def destroy
    @club = Club.find(params[:club_id])
    @field = Field.find(params[:id])
    @field.destroy
    redirect_to user_club_path(current_user, @club)
  end

  def field_params
    params.require(:field).permit(:outdoor, :price, :status, :field_number, :club_id)
  end
end
