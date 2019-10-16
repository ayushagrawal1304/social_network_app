class PostBroadcastJob < ApplicationJob
  queue_as :default

  def perform(post)
    ActionCable.server.broadcast 'post_channel', item: render(post) 
  end

  private   
    
    def render(post)  
      ApplicationController.renderer
                .render(partial: 'users/posts/post_list', 
                  locals: {posts: Post.where(community_id: post.community_id), community_id: post.community_id })  
    end  
end
