class ParticipationsController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    meeting = Meeting.find(params[:meeting_id])
    current_user.hope(meeting)
    to_user = User.find(params[:user_id])
    ParticipationMailer.send_when_hope_email(to_user, current_user, meeting).deliver
    flash[:success] = '参加希望を出しました。'
    redirect_to root_path
  end

  def destroy
    meeting = Meeting.find(params[:meeting_id])
    current_user.unhope(meeting)
    to_user = User.find(params[:user_id])
    ParticipationMailer.send_when_unhope_email(to_user, current_user, meeting).deliver
    flash[:success] = '参加希望を取り消しました。'
    redirect_to root_path
  end
end
