class Participation < ApplicationRecord
  belongs_to :user
  belongs_to :event

  validates :stripe_customer_id, presence: false 

  after_create :event_participation_confirmation

  def event_participation_confirmation
    UserMailer.event_participation_confirmation(self).deliver_now
  end

end
