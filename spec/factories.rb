FactoryGirl.define do
  factory :order_detail do
    order_id 1
    ticket_type_id 1
    quantity 1
  end
  factory :order do
    event_id 1
    total_price "9.99"
  end

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