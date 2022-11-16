require 'rails_helper'

RSpec.describe Withdraw, type: :model do
  it { is_expected.to belong_to(:account) }
  it { is_expected.to belong_to(:bank) }
  
end
