class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:edit, :update, :followings]
  def index
    @users = User.order(id: :desc).page(params[:page]).per(10)
  end

  def show
    @user = User.find(params[:id])
    @reviews = @user.review.order(id: :desc).page(params[:page])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = 'ユーザを登録しました。'
      redirect_to login_path
    else
      flash.now[:danger] = 'ユーザの登録に失敗しました。'
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
 
    if current_user == @user
 
      if @user.update(user_params)
        flash[:success] = 'ユーザー情報を編集しました。'
        render :edit
      else
        flash.now[:danger] = 'ユーザー情報の編集に失敗しました。'
      render :edit
      end   
 
    else
    redirect_to root_url
    end
  end
  
  def favindex
    @user = User.find(params[:id])
    @followings = @user.followings.page(params[:page])
  end
  
  def review_likes
    @user = User.find(params[:id])
    @favreviews = @user.favreviews.page(params[:page])
  end
  
  def game_likes
    @user = User.find(params[:id])
    @favgames = @user.favgames.page(params[:page])
  end
  
  def maker_likes
    @user = User.find(params[:id])
    @favmakers = @user.favmakers.page(params[:page])
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :email, :image, :password, :password_confirmation)
  end
end
