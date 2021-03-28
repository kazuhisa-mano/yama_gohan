require 'rails_helper'

RSpec.describe TagMap, type: :model do
  describe 'アソシエーションのテスト' do
    context 'Postモデルとの関係' do
      it 'N:1となっていること' do
        expect(TagMap.reflect_on_association(:post).macro).to eq :belongs_to
      end
    end
    context 'Tagモデルとの関係' do
      it 'N:1となっていること' do
        expect(TagMap.reflect_on_association(:tag).macro).to eq :belongs_to
      end
    end
  end
end
