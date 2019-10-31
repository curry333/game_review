class MakersController < ApplicationController
  before_action :require_user_logged_in
  
  def new
    @maker = Maker.new
  end

  def create
    @maker = Maker.new(maker_params)

    if @maker.save
      flash[:success] = '発売元メーカーを登録しました。'
      redirect_to new_game_path
    else
      flash.now[:danger] = '発売元メーカーの登録に失敗しました。'
      render :new
    end
  end
  
  private 

  def maker_params
    params.require(:maker).permit(:maker)
  end
  
end
