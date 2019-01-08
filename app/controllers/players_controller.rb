class PlayersController < ApplicationController

  def index
    @players = Player.all
  end

  def show
    @player = Player.find(params[:id])
  end

  def new
    @player = Player.new
  end

  def create
    @player = Player.new(player_params)
    @player.user = current_user
    if @player.save
      redirect_to root_path, notice: 'User profile was successfully created!'
    else
      render :new
    end
  end

  def edit
    @player = Player.find(params[:id])
  end

  def update
    @player = current_user.player
    if @player.update(player_params)
      redirect_to user_player_path(current_user, @player)
    else
      render :edit
    end
  end

  def destroy
  end

  private

  def player_params
    params.require(:player).permit(:user_id, :first_name, :last_name, :age, :description, :level, :gender, :photo, :city, :zip)
  end

end
