require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'アソシエーションのテスト' do
    context 'Postモデルとの関係' do
      it '1:Nとなっている'do
        expect(User.reflect_on_association(:posts).macro).to eq :has_many
      end
    end
  end

  context "データが正しく保存される" do
    before do
      @user = User.new
      @user.name = "test-name"
      @user.email = "test@test"
      @user.password = "aaaaaa"
      @user.save
    end
    it "全て入力されてあるので保存される" do
      expect(@user).to be_valid
    end
  end

  # it "isn't less than 1 character" do
  #   user = User.new
  #   expect(user).not_to be_valid
  # end

  it "パスワードがない場合は登録できないこと" do
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

  it "name, email, password, password_confirmationが存在すれば登録できること" do
    user = User.new(
      name: "test",
      email: "rspec@test",
      password: "123456",
      password_confirmation: "123456"
      )
      expect(user).to be_valid
  end

  it "password_confirmationがないと登録できない" do
    user = User.new(
      id: "1",
      name: "test",
      email: "rspec@test",
      password: "123456",
      password_confirmation: "",
      introduction: "sample",
      profile_image_id: "1",
      created_at: "2021-02-28 07:03:14",
      updated_at: "2021-02-28 07:03:14"
      )
      user.valid?
      expect(user.errors[:password_confirmation]).to include("doesn't match Password")
  end

end
