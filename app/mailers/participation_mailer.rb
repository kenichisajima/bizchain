class ParticipationMailer < ApplicationMailer
  
  def send_when_hope_email(to_user, from_user, meeting)
    @to_user = to_user
    @from_user = from_user
    @meeting = meeting
    mail to: to_user.email, subject: '交流会参加希望が届きました。'
  end
  
  def send_when_unhope_email(to_user, from_user, meeting)
    @to_user = to_user
    @from_user = from_user
    @meeting = meeting
    mail to: to_user.email, subject: '交流会参加希望解除が届きました。'
  end
  
end
