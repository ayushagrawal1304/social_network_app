class Community < ApplicationRecord
  has_many :user_approvals
  has_many :users, through: :user_approvals
  has_many :posts
  has_one_attached :image

  scope :approved, -> { where('user_approvals.approved = ?', true).order('created_at DESC') }
  scope :not_approved, -> { where('user_approvals.approved = ?', false).order('created_at DESC') }
  scope :own_community,-> (user_id){ where('user_id = ?', user_id).order('created_at DESC') }
end
