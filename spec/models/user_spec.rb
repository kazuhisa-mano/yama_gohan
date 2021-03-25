require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'アソシエーションのテスト' do
    context 'Postモデルとの関係' do
      it '1:Nとなっていること'do
        expect(User.reflect_on_association(:posts).macro).to eq :has_many
      end
    end
  end

  describe "バリデーションのテスト" do
    it "name, email, password, password_confirmationが存在すれば登録できること" do
      user = User.new(
        name: "test",
        email: "rspec@test",
        password: "123456",
        password_confirmation: "123456"
        )
        expect(user).to be_valid
    end

    it "passwordがない場合は登録できないこと" do
      user = User.new(
        id: "1",
        name: "test",
        email: "rspec@test",
        password: "",
        introduction: "sample",
        profile_image_id: "1",
        created_at: "2021-02-28 07:03:14",
        updated_at: "2021-02-28 07:03:14"
        )
        user.valid?
        expect(user.errors[:password]).to include("can't be blank")
    end

    it "password_confirmationがないと登録できないこと" do
      user = User.new(
        name: "test",
        email: "rspec@test",
        password: "123456",
        password_confirmation: "",
        )
        user.valid?
        expect(user.errors[:password_confirmation]).to include("doesn't match Password")
    end

    it "emailがない場合は登録できないこと" do
      user = User.new(
        name: "test",
        email: "",
        password: "123456",
        password_confirmation: "123456",
        )
        user.valid?
        expect(user.errors[:email]).to include("can't be blank")
    end
  end

end
