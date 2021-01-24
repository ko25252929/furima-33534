FactoryBot.define do
  factory :user do
    nickname              { 'test' }
    email                 { 'test@example' }
    password              { 'aa0000' }
    password_confirmation { password }
    first_name            { '太郎' }
    last_name             { '山田' }
    first_kana_name       { 'タロウ' }
    last_kana_name        { 'ヤマダ' }
    birthday              { '2000-10-10' }
  end
end
