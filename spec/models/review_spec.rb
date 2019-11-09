require 'rails_helper'
describe Review do
  describe '#create' do

    it "artistとtextがあれば保存できること" do
      review = build(:review,venue:"",image:"")
      expect(review).to be_valid
    end

    it "artistが無いと保存できない" do
      review = build(:review,artist:"")
      review.valid?
      expect(review.errors[:artist]).to include("を入力してください。")
    end

    it "textが無いと保存できない" do
      review = build(:review,text:"")
      review.valid? 
      expect(review.errors[:text]).to include("を入力してください。")
    end

  end
end