require 'rails_helper'

RSpec.describe User, type: :model do
  # context "データが正しく保存される" do
  #   before do
  #     @user = User.new
  #     @user.name = "test-name"
  #     @user.email = "test@test"
  #     @user.password = "aaaaaa"
  #     @user.save
  #   end
  #   it "全て入力されてあるので保存される" do
  #     expect(@user).to be_valid
  #   end
  # end
  
  it "is valid with a name, email and password" do
    user = User.new(
      name: "taro",
      email: "rspec@test",
      password: "aaaaaa"
    )
    expect(user).to be_vaild
  end 
end
