require 'rails_helper'

RSpec.describe User, type: :model do
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

  # it 'is invalid without a name' do
  #   user = User.new(
  #     name: "",
  #     email: "rspec@test",
  #     password: "123456",
  #     password_confirmation: "123456"
  #     )
  #     user.valid?
  #     expect(user.errors[:name]).to include("を入力してください")
  # end

  # it "is valid with a name, email and password" do
  #   user = User.new(
  #     name: "taro",
  #     email: "rspec@test",
  #     password: "aaaaaa",
  #     introduction: "sample",
  #     profile_image_id: "1",
  #     created_at: "1",
  #     updated_at: "1"
  #     )
  #     expect(user).to be_vaild
  # end
end
