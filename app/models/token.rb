class Token < ApplicationRecord
  include ModelHelper
  # Using state machine so we can maintain state of a key 
  include AASM 

  validates :key, presence: true
  validates :key, uniqueness: { case_sensitive: false }
  validates :key, length: { minimum: 5, maximum: 8 }

  aasm do 
    state :new, initial: true
    state :blocked 
    state :used
    
    event :block do
      transitions from: :new, to: :blocked
    end

    event :mark_used do
      transitions from: :blocked, to: :used
    end
  end

  scope :new_token,-> { where(:aasm_state => :new).first }
  

  def self.generate_url 
    # Assumption is that we always have new keys in the system and a way to monitor 
    # and replenish the tokens and move this as a micro service so we can scale
    token = self.new_token
    token.block!
    return self.host_url+token.key
  end
end
