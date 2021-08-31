class BlacklistUrl < ApplicationRecord
  # Idea is that we will Index all the url's using elasticsearch 

  def self.is_listed?(url)
    self.find_by_url(:url) ? true : false 
  end
end
