FactoryBot.define do
  factory :user do
    nickname              {"test"}
    email                 {"test@example"}
    password              {"aa0000"}
    password_confirmation {password}
    first_name            {"test"}
    last_name             {"test"}
    first_kana_name       {"test"}
    last_kana_name        {"test"}
    birthday              {"2000-10-10"}
  end
end