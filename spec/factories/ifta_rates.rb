FactoryBot.define do
  factory :ifta_rate do
    year { 2022 }
    quarter { 1 }
    status { "" }
    rates { {} }
    error { "" }
  end
end
