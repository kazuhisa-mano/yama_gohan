require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'アソシエーションのテスト' do
    context 'Postモデルとの関係' do
      it '1:Nとなっていること'do
        expect(User.reflect_on_association(:posts).macro).to eq :has_many
      end
    end
  end

  describe "#create" do
    it "name, email, password, password_confirmationが存在すれば登録できること" do
      user = build(:user)
      expect(user).to be_valid
    end

    it "nameが無い場合は登録できないこと" do
      user = build(:user, name: "")
      user.valid?
      expect(user.errors[:name]).to include("can't be blank")
    end

    it "emailが無い場合は登録できないこと" do
      user = build(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    it "passwordが無い場合は登録できないこと" do
      user = build(:user, password: "")
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end

    it "password_confirmationが無い場合は登録できないこと" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("doesn't match Password")
    end

    it "introductionは100文字以下であること" do
      user = User.new(introduction: "a" * 101)
      expect(user.invalid?).to be true
    end
  end
end
