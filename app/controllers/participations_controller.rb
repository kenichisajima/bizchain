class ParticipationsController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    meeting = Meeting.find(params[:meeting_id])
    current_user.hope(meeting)
    flash[:success] = '参加希望を出しました。'
    redirect_to root_path
  end

  def destroy
    meeting = Meeting.find(params[:meeting_id])
    current_user.unhope(meeting)
    flash[:success] = '参加希望を取り消しました。'
    redirect_to root_path
  end
end
