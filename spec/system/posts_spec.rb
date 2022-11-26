require 'rails_helper'

RSpec.describe "Posts", type: :system do
  let(:user) { create(:user) }
  let(:post) { create(:post, user: user) }

  before do
    visit root_path
    click_link "ログイン"
    fill_in "メールアドレス", with: user.email
    fill_in "パスワード", with: user.password
    click_button "ログインする"
  end

  it '自分の投稿へアクセルができること' do
    click_link '自分の投稿'
    expect(current_path).to eq posts_path
  end

  it 'みんなの投稿へアクセルができること' do
    click_link 'みんなの投稿'
    expect(current_path).to eq index_all_posts_path
  end

  it 'ロゴクリックでTOPページへアクセスができること' do
    click_link 'logo'
    expect(current_path).to eq root_path
  end

  describe '投稿' do
    it '新規投稿ページへアクセスができること' do
      click_link "投稿"
      visit new_post_path
      expect(page).to have_content '新規作成'
      expect(current_path).to eq new_post_path
    end

    it '投稿が完了できること' do
      visit new_post_path
      fill_in "post[introduction]", with: post.introduction
      fill_in "post[title]", with: post.title
      attach_file "post[post_image]", "#{Rails.root}/spec/fixtures/images/test.jpg", visible: false
      click_button '確認画面へ'
      select '投稿する', from: 'select'
      click_button '完了'
      expect(page).to have_content '自分の投稿'
      expect(current_path).to eq posts_path
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
        expect(page).to have_content '入力漏れがあります。お手数ですが、入力内容をご確認のうえ再度お試しください。'
        expect(current_path).to eq new_post_path
      end

      it '紹介文が空だと投稿できないこと' do
        fill_in "post[title]", with: post.title
        fill_in "post[introduction]", with: ''
        expect(page).to have_content '入力漏れがあります。お手数ですが、入力内容をご確認のうえ再度お試しください。'
        expect(current_path).to eq new_post_path
      end
    end
  end

  describe '下書き機能' do
    it '下書き保存できること' do
      visit new_post_path
      fill_in "post[introduction]", with: post.introduction
      fill_in "post[title]", with: post.title
      attach_file "post[post_image]", "#{Rails.root}/spec/fixtures/images/test.jpg", visible: false
      click_button '確認画面へ'
      select '下書き', from: 'select'
      click_button '完了'
      expect(page).to have_content '下書き一覧'
      expect(current_path).to eq draft_posts_path
    end
  end
end
