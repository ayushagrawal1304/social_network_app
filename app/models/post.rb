class Post < ApplicationRecord
  has_many :comments, as: :commentable
  has_many :likes, as: :likable
  has_many_attached :attachments
  belongs_to :user
  belongs_to :community

  validates :content, presence: true
  validates :title, presence: true
  validates :attachments, presence: true

  after_create_commit { PostBroadcastJob.perform_later self }  
  after_update_commit { PostBroadcastJob.perform_later self }  
  after_destroy { PostBroadcastJob.perform_later self } 
end
   