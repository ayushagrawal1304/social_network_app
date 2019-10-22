require 'rails_helper'

RSpec.describe UserApproval, :type => :model do
  it { is_expected.to belong_to :community }
  it { is_expected.to belong_to :user }
end