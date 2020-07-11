class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:index, :show, :edit, :update, :meetings, :participating_meetings]
  
  def index
    @users = User.order(id: :desc).page(params[:page]).per(25)
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      flash[:success] = 'ユーザ登録しました。'
      redirect_to @user
    else
      flash[:danger] = 'ユーザ登録失敗しました。'
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    
    if @user.update(user_params)
      flash[:success] = '正常に更新されました'
      redirect_to @user
    else
      flash.now[:danger] = '更新されませんでした'
      render :edit
    end
  end
  
  def meetings
    @user = User.find(params[:id])
    @meetings = @user.meetings.order(id: :desc).page(params[:page])
  end
  
  def participating_meetings
    @user = User.find(params[:id])
    @participating_meetings = @user.participating_meetings.page(params[:page])
  end
    
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :profile)
  end
end
