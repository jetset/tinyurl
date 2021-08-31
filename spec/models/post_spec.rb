require 'rails_helper'

RSpec.describe Post, type: :model do

  let(:valid_url) { "https://www.valid.com/"}
  let(:invalid_url) { "httpswww.valid.com/"}
  let(:valid_tiny_url){"https://localhost/abc12345"}

  subject {
    build(:post, :url => valid_url,:tiny_url => valid_url)
  }

  before do 
    allow(Token).to receive(:generate_url).and_return(valid_tiny_url)
  end

  
  context "Validations" do
    it "is valid with presense of attributes" do
      expect(subject).to be_valid
    end

    it "is invalid without original url attribute" do
      subject.url= nil
      expect(subject).to be_invalid
    end
  end
end
