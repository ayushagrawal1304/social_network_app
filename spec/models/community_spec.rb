require 'rails_helper'

RSpec.describe Community, :type => :model do
  
  describe '#content' do
    it { should validate_presence_of(:name) }
  end

  it { is_expected.to have_many :user_approvals }
  it { is_expected.to have_many :users }
  it { is_expected.to have_many :posts }

end