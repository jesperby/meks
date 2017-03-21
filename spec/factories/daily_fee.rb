FactoryGirl.define do
  factory :daily_fee do
    home { create(:home) }
    start_date { Date.today - rand(7..12).months }
    end_date { Date.today - rand(1..6).months }
    fee { rand(500..5000) }
  end
end
