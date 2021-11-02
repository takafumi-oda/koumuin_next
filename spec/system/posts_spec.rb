require 'rails_helper'

RSpec.describe "Posts", type: :system do
  let(:user) { create(:test_user) }
  let(:post) { create(:post, user_id: user.id) }

  before do
    visit login_path
    fill_in "メールアドレス", with: user.email
    fill_in "パスワード", with: user.password
    click_on "ログインする"
  end

  describe "相談の新規登録" do
    before do
      visit new_post_path
    end

    it "登録成功" do
      fill_in "タイトル", with: "テスト相談のタイトル"
      fill_in "本文", with: "テスト相談の本文"
      click_button "相談する"
      expect(page).to have_content "新しい相談をしました"
    end

    it "登録失敗" do
      click_button "相談する"
      expect(page).to have_content "新しい相談の登録に失敗しました"
    end
  end

  describe "相談の削除" do
    describe "回答がない場合" do
      it "削除成功" do
        visit post_path(post.id)
        click_on "相談を削除する"
        expect(page).to have_content "相談を削除しました"
      end
    end

    describe "回答がある場合" do
      let!(:reply) { create(:reply, user_id: user.id, post_id: post.id) }

      it "削除不可" do
        visit post_path(post.id)
        expect(page).not_to have_content "相談を削除する"
      end
    end
  end
end
