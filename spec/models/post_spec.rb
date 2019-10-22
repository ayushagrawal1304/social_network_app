require 'rails_helper'

RSpec.describe Post, :type => :model do
  
  describe '#content' do
    it { should validate_presence_of(:content) }
    it { should validate_presence_of(:title) }
  end

  it { is_expected.to have_many :comments }
  it { is_expected.to have_many :likes }
  it { is_expected.to belong_to :user }
  it { is_expected.to belong_to :community }

end