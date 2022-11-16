require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to have_many(:accounts) }
  it { is_expected.to have_many(:banks) }
  it { is_expected.to validate_presence_of(:username) }
  it { is_expected.to validate_confirmation_of(:password) }
  it { is_expected.to validate_presence_of(:password_confirmation) }

  subject { @user }

  before do
    @user = User.new(username: "Example User", password: "123123", password_confirmation: "123123")
  end

  describe "when username isn't present" do
    before { @user.username = " " }
    it {should_not be_valid}
  end

  describe "when password isn't present" do
    before do
    @user = User.new(username: "Example User", password: " ", password_confirmation: " ")
    end
    it { should_not be_valid }
    end

  describe "with a password is to short" do
    before { @user.password = @user.password_confirmation = "a" * 5 }
    it { should_not be_valid }
  end

  describe "when password doesn't match confirmation" do
    before { @user.password_confirmation = "mismatch" }
    it { should_not be_valid }
  end
end
