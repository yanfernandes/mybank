require 'rails_helper'

RSpec.describe Account, type: :model do
  it { is_expected.to belong_to(:user) }
  it { is_expected.to belong_to(:bank) }
  it { is_expected.to have_many(:deposits) }
  it { is_expected.to have_many(:withdraws) }
end
