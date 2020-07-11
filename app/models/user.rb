class User < ApplicationRecord
  before_save { self.email.downcase! }
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },uniqueness: { case_sensitive: false }
  validates :profile, presence: true
  has_secure_password
  
  has_many :meetings
  has_many :participations
  has_many :participating_meetings, through: :participations, source: :meeting
  
  def hope(meeting)
    self.participations.find_or_create_by(meeting_id: meeting.id)
  end
  
  def unhope(meeting)
    participation = self.participations.find_by(meeting_id: meeting.id)
    participation.destroy if participation
  end
  
  def hope?(meeting)
    self.participating_meetings.include?(meeting)
  end
end
