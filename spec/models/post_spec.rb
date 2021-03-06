require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:user) { create(:test_user) }
  let(:post) { create(:post, user_id: user.id) }

  describe "バリデーションの検証" do
    it "相談が作成できていること" do
      expect(post).to be_valid
    end

    it "タイトルが空では登録できないこと" do
      post.title = ''
      expect(post).not_to be_valid
    end

    it "本文が空では登録できないこと" do
      post.content = ''
      expect(post).not_to be_valid
    end
  end
end
