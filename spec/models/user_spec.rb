require 'rails_helper'

RSpec.describe User, :type => :model do
  
  describe '#first_name' do
    it { should validate_presence_of(:first_name) }
    it { should validate_length_of(:first_name).is_at_most(20) }
  end

  describe '#last_name' do
    it { should validate_presence_of(:last_name) }
    it { should validate_length_of(:last_name).is_at_most(20) }
  end

  describe '#password' do
    it { should validate_presence_of(:password) }
  end
  
  describe '#email' do
    it { should_not allow_value("blah").for(:email) }
    it { should allow_value("a@b.com").for(:email) }
  end

  describe '#mobile_no' do
    it { should validate_presence_of(:mobile_no) }
  end

  it { is_expected.to have_many :user_approvals }
  it { is_expected.to have_many :posts }
  it { is_expected.to have_many :comments }
  it { is_expected.to have_many :likes }

end