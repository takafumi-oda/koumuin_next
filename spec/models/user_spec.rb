require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = create(:test_user)
  end

  describe "バリデーションの検証" do
    it "ユーザー登録ができていること" do
      expect(@user).to be_valid
    end

    it "ユーザー名が空では登録できないこと" do
      @user.name = ''
      expect(@user).not_to be_valid
    end

    it "ユーザー名が21文字以上では登録できないこと" do
      @user.name = '012345678901234567890'
      expect(@user).not_to be_valid
    end

    it "メールアドレスが空では登録できないこと" do
      @user.email = ''
      expect(@user).not_to be_valid
    end

    it "メールアドレスを重複して登録できないこと" do
      another_user = build(:test_user, email: "@user.email")
      expect(another_user).not_to be_valid
    end

    it "メールアドレスがフォーマット（〇〇@〇〇.〇〇）以外では登録できないこと" do
      @user.email = 'test@email'
      expect(@user).not_to be_valid
    end

    it "パスワードが空では登録できないこと" do
      another_user = build(:test_user, password: "")
      expect(another_user).not_to be_valid
    end

    it "パスワードとパスワード（確認用）が不一致では登録できないこと" do
      another_user = build(:test_user, password_confirmation: "anotherpass")
      expect(another_user).not_to be_valid
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

    it "自己紹介が101文字以上では登録できないこと" do
      @user.introduction = '01234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890'
      expect(@user).not_to be_valid
    end
  end
end
