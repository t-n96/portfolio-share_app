require 'rails_helper'

RSpec.describe "Posts", type: :system do
  let(:user) { create(:user) }
  let(:post) { create(:post) }

  before do
    visit root_path
    click_link "ログイン"
    fill_in "ユーザー名", with: user.name
    fill_in "メールアドレス", with: user.email
    fill_in "パスワード", with: user.password
    click_button "ログインする"
  end

  describe '投稿' do
    it '新規投稿ページへアクセスができること' do
      click_link "投稿"
      visit new_post_path
      expect(page).to have_content '新規作成'
      expect(current_path).to eq new_post_path
    end
  end

end
