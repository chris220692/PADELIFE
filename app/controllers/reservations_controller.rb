class ReservationsController < ApplicationController
  def index
    @reservations = Reservation.all
  end

  def show
    @reservation = Reservation.find(params[:id])
  end

  def new
    @user = current_user
    @field = Field.find(params[:field_id])
    @reservation = Reservation.new
  end

  def edit
    @user = current_user
    @field = Field.find(params[:field_id])
    @reservation = Reservation.find(params[:id])
  end

  def create
    @user = current_user
    @field = Field.find(params[:field_id])
    @reservation = Reservation.new(reservation_params)
    @reservation.field = @field
    @reservation.user = @user
    if @reservation.save
      redirect_to root_path, notice: 'Reservation is successfully done!'
    else
      render :new
    end
  end

  def update
    @user = current_user
    @field = Field.find(params[:field_id])
    @reservation = Reservation.find(params[:id])
    if @reservation.update(reservation_params)
      redirect_to root_path, notice: 'Reservation has succefully been updated!'
    else
      render :edit
    end
  end

  def destroy
    @user = current_user
    @field = Field.find(params[:field_id])
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    redirect_to root_path, notice: 'Reservation has been deleted'
  end

  def reservation_params
    params.require(:reservation).permit(:starting_hour, :ending_hour, :field_id, :user_id)
  end
end
