require 'rails_helper'

RSpec.describe "Posts", type: :system do
  let(:user) { create(:user) }
  let(:user2) { create(:user) }
  let(:post) { create(:post, user: user) }
  let(:post2) { create(:post, user: user2) }

  before do
    visit root_path
    click_link "ログイン"
    fill_in "ユーザー名", with: user.name
    fill_in "メールアドレス", with: user.email
    fill_in "パスワード", with: user.password
    click_button "ログインする"
  end

  it '自分の投稿へアクセルができること' do
    click_link '自分の投稿'
    visit posts_path
  end

  it 'みんなの投稿へアクセルができること' do
    click_link 'みんなの投稿'
    visit index_all_posts_path
  end

  describe '投稿' do
    it '新規投稿ページへアクセスができること' do
      click_link "投稿"
      visit new_post_path
      expect(page).to have_content '新規作成'
      expect(current_path).to eq new_post_path
    end

    context '空入力があると投稿できないこと' do
      before do
        visit new_post_path
        attach_file "post[post_image]", "#{Rails.root}/spec/fixtures/images/test.jpg", visible: false
        click_button "確認画面へ"
      end

      it 'タイトルが空だと投稿できないこと' do
        fill_in "post[title]", with: ''
        fill_in "post[introduction]", with: post.introduction
        expect(page).to have_content 'すべて入力・選択してください。'
        expect(current_path).to eq new_post_path
      end

      it '紹介文が空だと投稿できないこと' do
        fill_in "post[title]", with: post.title
        fill_in "post[introduction]", with: ''
        expect(page).to have_content 'すべて入力・選択してください。'
        expect(current_path).to eq new_post_path
      end
    end
  end
end
