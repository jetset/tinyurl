require "rails_helper"

RSpec.describe V1::PostsController, type: :routing do
  describe "routing" do
    it "routes to #show" do
      expect(get: "/v1/posts/1").to route_to("v1/posts#show", id: "1")
    end

    it "routes to #create" do
      expect(post: "/v1/posts").to route_to("v1/posts#create")
    end
  end
end
