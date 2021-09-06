FactoryBot.define do
  factory :user do
    email {"v_berkela@ukr.net"}
    full_name {"Vlad Test"}
    is_admin {0}
    encrypted_password {"$2a$12$JTCcRiIEUcn7jWZfrnaUJ.OT8oPjSn9NL5wr5WtMvuDeHAHY8HD12"}
    created_at {"2021-08-03 16:44:56.148008"}
    updated_at {"2021-08-03 16:44:56.148008"}
  end
end
