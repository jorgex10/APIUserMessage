class Session < ActiveRecord::Base
  
  include Tokenable
  belongs_to :device
  before_create :set_expired_at

  def set_expired_at
    self.expired_at = Time.zone.now + 2.days
  end

  def expired?
    self.expired_at < Time.zone.now
  end

end
