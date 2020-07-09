class Meeting < ApplicationRecord
  belongs_to :user
  
  validates :name, presence: true
  validates :place, presence: true
  validates :start_from, presence: true
  validates :content, presence: true
end
