require 'rails_helper'

RSpec.describe "Users", type: :system do
  let(:user) { create(:test_user) }

  describe "ユーザーの新規登録" do
    before do
      visit new_user_path
    end

    it "登録成功" do
      fill_in "ユーザー名", with: "テストユーザー"
      fill_in "メールアドレス", with: "test@email.co.jp"
      fill_in "パスワード", with: "testpass"
      fill_in "パスワード(確認)", with: "testpass"
      find("#user_age_30代").click
      find("#user_organization_地方公務員").click
      find("#user_job_事務系").click
      find("#user_status_現職").click
      fill_in "自己紹介", with: "テストユーザーの自己紹介"
      click_on "登録する"
      expect(page).to have_content "登録しました"
    end

    it "登録失敗" do
      click_on "登録する"
      expect(page).to have_content "登録に失敗しました"
    end
  end

  describe "トップページからのログイン" do
    before do
      visit root_path
    end

    it "ログイン成功" do
      fill_in "メールアドレス", with: user.email
      fill_in "パスワード", with: user.password
      click_on "ログインする"
      expect(page).to have_content "ログインしました"
    end

    it "ログイン失敗" do
      click_on "ログインする"
      expect(page).to have_content "メールアドレスかパスワードが間違っています"
    end
  end

  describe "ログインページからのログイン" do
    before do
      visit login_path
    end

    it "ログイン成功" do
      fill_in "メールアドレス", with: user.email
      fill_in "パスワード", with: user.password
      click_on "ログインする"
      expect(page).to have_content "ログインしました"
    end

    it "ログイン失敗" do
      click_on "ログインする"
      expect(page).to have_content "メールアドレスかパスワードが間違っています"
    end
  end

  describe "ログイン時のユーザー機能の検証" do
    before do
      visit login_path
      fill_in "メールアドレス", with: user.email
      fill_in "パスワード", with: user.password
      click_on "ログインする"
    end

    describe "ユーザー情報の変更" do
      before do
        visit edit_user_path(user.id)
      end
      it "変更成功" do
        click_on "変更する"
        expect(page).to have_content "ユーザー情報を変更しました"
      end

      it "変更失敗" do
        fill_in "ユーザー名", with: ""
        click_on "変更する"
        expect(page).to have_content "ユーザー情報の変更に失敗しました"
      end
    end

    describe "パスワードの変更" do
      before do
        visit edit_password_path(user.id)
      end
      it "変更成功" do
        fill_in "パスワード", with: "changepass"
        fill_in "パスワード(確認)", with: "changepass"
        click_on "パスワードを変更する"
        expect(page).to have_content "パスワードを変更しました"
      end

      it "変更失敗" do
        click_on "パスワードを変更する"
        expect(page).to have_content "パスワードの変更に失敗しました"
      end
    end

    describe "ユーザー情報画面の機能の検証" do
      describe "設定画面への遷移" do
        it "遷移成功" do
          visit user_path(user.id)
          find("#test-btn").click
          expect(page).to have_current_path edit_user_path(user.id), ignore_query: true
        end
      end

      describe "パスワード変更画面への遷移" do
        it "遷移成功" do
          visit user_path(user.id)
          click_on "パスワード変更"
          expect(page).to have_current_path edit_password_path(user.id), ignore_query: true
        end
      end
    end
  end

end
