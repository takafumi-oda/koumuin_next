require 'rails_helper'

RSpec.describe "Replies", type: :system do
  let(:user) { create(:test_user) }
  let(:post) { create(:post, user_id: user.id) }

  before do
    visit login_path
    fill_in "メールアドレス", with: user.email
    fill_in "パスワード", with: user.password
    click_on "ログインする"
  end

  describe "回答する" do
    before do
      visit post_path(post.id)
    end

    it "回答成功" do
      fill_in "回答を入力する", with: "テスト相談への回答"
      click_button "回答する"
      expect(page).to have_content "この相談に回答しました"
    end

    it "回答失敗" do
      click_button "回答する"
      expect(page).to have_content "この相談への回答が登録できませんでした"
    end
  end

  describe "返信する" do
    let!(:reply) { create(:reply, user_id: user.id, post_id: post.id) }

    before do
      visit post_path(post.id)
    end

    it "返信成功" do
      fill_in "返信を入力する", with: "回答への返信"
      click_button "返信する"
      expect(page).to have_content "この回答に返信しました"
    end

    it "回答失敗" do
      click_button "返信する"
      expect(page).to have_content "この回答への返信が登録できませんでした"
    end
  end
end
