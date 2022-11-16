require 'rails_helper'

RSpec.describe Bank, type: :model do
  it { is_expected.to have_many(:deposits) }
  it { is_expected.to have_many(:accounts) }
  it { is_expected.to have_many(:users) }
  it { is_expected.to have_many(:withdraws) }
end
