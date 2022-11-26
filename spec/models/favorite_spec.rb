require 'rails_helper'

RSpec.describe Favorite, type: :model do
  before do
    @favorite = FactoryBot.build(:favorite)
  end

  describe 'いいねが正しくできること' do
    it 'user_idとpost_idがあれば正しく保存できること' do
      expect(FactoryBot.build(:favorite)).to be_valid
    end
  end
end
