require 'rails_helper'

RSpec.describe Token, type: :model do
  let(:key_too_small) {'1235'}
  let(:key_min_len) {'abc12'}
  let(:key_too_big) {'abcdef1235'}
  let(:valid_key) {"abcd1234"}

  subject {
    build(:token, :key => valid_key)
  }
  
  context "Validations" do
    it "is valid with presense of key attribute" do
      expect(subject).to be_valid
    end

    it "is invalid without key attribute" do
      subject.key = nil
      expect(subject).to be_invalid
    end

    it "is valid min lenght of key attribute" do 
      subject.key = key_min_len
      expect(subject).to be_valid
    end

    it "is invalid if key attribute is smaller than min lengh" do 
      subject.key = key_too_small
      expect(subject).to be_invalid
    end


    it "is invalid max length too big for key attribute" do 
      subject.key = key_too_big
      expect(subject).to be_invalid
    end    
    
    it "validates uniqueness of key attribute" do 
      expect(create(:token , :first_key)).to be_valid
      #Try creating with the same key again
      expect{create(:token , :first_key) }.to raise_exception(ActiveRecord::RecordInvalid)
    end

  end
end
