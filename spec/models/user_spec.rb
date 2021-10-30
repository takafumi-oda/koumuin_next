require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = build(:test_user)
  end

  describe "バリデーションの検証" do
    it "ユーザー名が空では登録できないこと" do
      @user.name = ''
      expect(@user).not_to be_valid
    end

    it "メールアドレスが空では登録できないこと" do
      @user.email = ''
      expect(@user).not_to be_valid
    end

    it "パスワードが空では登録できないこと" do
      @user.password_digest = ''
      expect(@user).not_to be_valid
    end

    it "年代が空では登録できないこと" do
      @user.age = ''
      expect(@user).not_to be_valid
    end

    it "組織が空では登録できないこと" do
      @user.organization = ''
      expect(@user).not_to be_valid
    end

    it "職種が空では登録できないこと" do
      @user.job = ''
      expect(@user).not_to be_valid
    end

    it "現在の状況が空では登録できないこと" do
      @user.status = ''
      expect(@user).not_to be_valid
    end
  end
end
