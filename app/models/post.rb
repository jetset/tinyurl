class Post < ApplicationRecord
  include ModelHelper

  URL_REGEX = /\A(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?\z/ix
  
  validates :url, presence: true
  validates :tiny_url, presence: true
  validates_format_of :url, :with => URL_REGEX
  validate :is_blacklisted?, on: :create

  before_validation :build_tiny_url, on: :create

  # Checks if the url is blacklisted 
  def is_blacklisted?
    errors.add(:url, "is blacklisted") if BlacklistUrl.is_listed?(self.url)
  end

  # Given an id / token this method returns url
  def self.full_tiny_url(id)
    self.host_url + id
  end

  private 
  # Get the token and build the url 
  def build_tiny_url
    self.tiny_url = Token.generate_url
  end

end
