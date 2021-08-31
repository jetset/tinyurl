module ModelHelper
  extend ActiveSupport::Concern

  module ClassMethods
    def host_url
      ENV['HOST_URL'].present? ? ENV['HOST_URL'] : 'http://localhost:3000/'
    end
  end
end