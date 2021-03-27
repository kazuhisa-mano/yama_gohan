FactoryBot.define do
  factory :user do
    name                  {"taro"}
    email                 {"taro@test"}
    password              {"123456"}
    password_confirmation {"123456"}
  end
end