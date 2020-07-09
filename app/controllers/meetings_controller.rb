class MeetingsController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:destroy, :edit, :update]
  
  def show
    @meeting = Meeting.find(params[:id])
  end

  def new
    if logged_in?
      @meeting = current_user.meetings.build
    end
  end

  def create
    @meeting = current_user.meetings.build(meeting_params)
    if @meeting.save
      flash[:success] = '交流会を登録しました。'
      redirect_to root_url
    else
      flash.now[:danger] = '交流会の登録に失敗しました。'
      render 'new'
    end
  end

  def destroy
    @meeting.destroy
    flash[:success] = 'メッセージを削除しました。'
    redirect_back(fallback_location: root_path)
  end

  def edit
    @meeting = Meeting.find(params[:id])
  end

  def update
    @meeting = Meeting.find(params[:id])
    
    if @meeting.update(meeting_params)
      flash[:success] = '正常に更新されました'
      redirect_to @meeting
    else
      flash.now[:danger] = '更新されませんでした'
      render :edit
    end
  end
  
  private
  
  def meeting_params
    params.require(:meeting).permit(:name, :place, :start_from, :content)
  end
  
  def correct_user
    @meeting = current_user.meetings.find_by(id: params[:id])
    unless @meeting
      redirect_to root_url
    end
  end
end
