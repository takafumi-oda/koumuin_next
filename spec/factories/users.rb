FactoryBot.define do
  factory :test_user, class: User do
    name { "テストユーザー" }
    email { "test@email" }
    password { "test" }
    password_confirmation { "test" }
    age { "30代" }
    organization { "地方公務員" }
    job { "事務系" }
    status { "現職" }
    introduction { "テストユーザーの自己紹介" }
    active { true }
    admin { false }
  end
end
