require 'rails_helper'

RSpec.describe 'Posts', type: :model do
  before do
    @post = FactoryBot.build(:post)
  end

  describe '投稿が正しくできること' do
    it '内容に問題がないこと' do
      expect(@post).to be_valid
    end

    it '正しく保存ができること' do
      expect(FactoryBot.build(:post)).to be_valid
    end
  end
end
