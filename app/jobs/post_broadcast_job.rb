class PostBroadcastJob < ApplicationJob
  queue_as :default

  def perform(post)
    ActionCable.server.broadcast 'post_channel', item: render(post) 
  end

  private   
    
    def render(post)  
      @community = Community.find(post[:community_id])
      @post = @community.posts.order('created_at DESC')
              .paginate(:page => post[:page], :per_page => 10)
      #ApplicationController.renderer.render "users/posts/index", locals: {:@community => @community, :@post => @post}
    end  
end
