class GamesController < ApplicationController
  before_action :require_user_logged_in
  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)

    if @game.save
      flash[:success] = 'ゲームタイトルを登録しました。'
      redirect_to root_url
    else
      flash.now[:danger] = 'ゲームタイトルの登録に失敗しました。'
      render :new
    end
  end
  
  private 

  def game_params
    params.require(:game).permit(:title, :maker_id)
  end
  
end
