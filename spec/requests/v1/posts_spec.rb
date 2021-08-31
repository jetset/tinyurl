require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/v1/posts", type: :request do
  

  let(:token){'abc12345'}
  let(:valid_tiny_url){"http://localhost:3000/#{token}"}
  let(:valid_attributes) {
    {url: "https://www.google.com/"}
  }

  let(:invalid_attributes) {
    {url: "httpinvalidurl.com"}
  }
  
  let(:valid_headers) {
    {}
  }

  before do 
    allow(Token).to receive(:generate_url).and_return(valid_tiny_url)
  end

  describe "GET /show" do
    it "redirects to the original url" do
      post = Post.create! valid_attributes
      get v1_post_url(token), as: :json
      expect(response).to redirect_to(post.url)
    end

    it "show NOT found when tiny url doesn't match" do
      get v1_post_url('notfoundurl123'), as: :json
      expect(response).to have_http_status(:not_found)
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Post" do
        expect {
          post v1_posts_url,
               params: { post: valid_attributes }, headers: valid_headers, as: :json
        }.to change(Post, :count).by(1)
      end

      it "renders a JSON response with the new posts" do
        post v1_posts_url,
             params: { post: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including("application/json"))
        parsed_response = JSON.parse(response.body)
        expect(parsed_response["tiny_url"]).to eq(valid_tiny_url)
      end
    end

    context "with invalid parameters" do
      it "does not create a new Action" do
        expect {
          post v1_posts_url,
               params: { post: invalid_attributes }, as: :json
        }.to change(Post, :count).by(0)
      end

      it "renders a JSON response with errors for the new v1_action" do
        post v1_posts_url,
             params: { post: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end
end