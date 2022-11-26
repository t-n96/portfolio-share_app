require 'rails_helper'

RSpec.describe "Favorites", type: :system do
  let(:user) { create(:user) }
  let(:post) { create(:post, user: user) }

  before do
    visit root_path
    click_link "ログイン"
    fill_in "メールアドレス", with: user.email
    fill_in "パスワード", with: user.password
    click_button "ログインする"
  end

  describe '#create,#destroy' do
    it 'ユーザーが他の投稿をいいね、いいね解除できること' do
      visit index_all_posts_path(post.id)

      click_link 'favo-post'
      expect(post.favorites.count).to eq(1)

      click_link 'favo-delete'
      expect(post.favorites.count).to eq(0)
    end
  end
end
