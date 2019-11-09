require 'rails_helper'
describe User do
  describe '#create' do

    it "nicknameとemail、passwordとpassword_confirmationが存在すれば登録できること" do
      user = build(:user)
      expect(user).to be_valid
    end


    it "nicknameが空では登録できないこと" do
      user = build(:user,nickname:"")
      user.valid?
      expect(user.errors[:nickname]).to include("が入力されていません。")
    end

    it "emailが空では登録できないこと" do
      user = build(:user,email: "")
      user.valid?
      expect(user.errors[:email]).to include("が入力されていません。")
    end

    it "passwordが空では登録できないこと" do
      user = build(:user,password:"")
      user.valid? 
      expect(user.errors[:password]).to include("が入力されていません。")
    end

    it "passwordが存在してもpassword_confirmationが空では登録できないこと" do
      user = build(:user,password_confirmation:"")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("が内容とあっていません。")
    end

    it "nicknameが10文字以上では登録できない事" do
    user = build(:user,nickname:"testtest100")
    user.valid?
    expect(user.errors[:nickname]).to include("は10文字以下に設定して下さい。")
    end

    it "nicknameが9文字以下では登録できる事" do
    user = build(:user,nickname:"testtest9")
    expect(user).to be_valid
    end

    it "重複したemailが存在する場合登録できないこと" do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("は既に使用されています。")
    end

    it "passwordが6文字以上であれば登録できること" do
      user = build(:user,password:"123456",password_confirmation:"123456")
      expect(user).to be_valid
    end 

    it "passwordが5文字以下であれば登録できないこと" do
      user = build(:user,password:"12345",password_confirmation:"12345")
      user.valid?
      expect(user.errors[:password]).to include("は6文字以上に設定して下さい。")
    end


  end
end