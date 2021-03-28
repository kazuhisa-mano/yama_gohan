require 'rails_helper'

RSpec.describe Tag, type: :model do
  describe 'アソシエーションのテスト' do
    context 'TagMapモデルとの関係' do
      it '1:Nとなっていること' do
        expect(Tag.reflect_on_association(:tag_maps).macro).to eq :has_many
      end
    end
  end
  
  describe "#create" do
    it "tag_nameは100文字以下であること" do
      tag = Tag.new(tag_name: "a"*101)
      tag.valid?
      expect(tag.errors[:tag_name]).to include("is too long (maximum is 100 characters)")
    end
  end
end
