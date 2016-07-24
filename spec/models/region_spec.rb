require 'rails_helper'

RSpec.describe Region, type: :model do
  it "should work" do
      region1 = create(:region)
      expect(region1).to eq Region.first
  end
end
