FactoryGirl.define do

  factory :event do
    #venue
    #category
    extended_html_description "<h1>hello</h1>"
  end

  factory :region do
    name ['Ho Chi Minh', 'Ha Noi', 'Binh Thuan', 'Da Nang', 'Lam Dong'].sample
  end

  factory :venue do
    name "RMIT"
    full_address "123 test"
    region
  end

  factory :category do
    name "Entertainment"
  end
end