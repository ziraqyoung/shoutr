class LikesController < ApplicationController
  before_action :require_login

  def create
    current_user.like(shout)
    redirect_to root_path
  end

  def destroy
    current_user.unlike(shout)
    redirect_to root_path
  end

  private

    def shout
      # we use params[:id] becasue we are using member route
      # for nested resource it would have been params[:post_id]
      @_shout ||= Shout.find(params[:id])
    end
end
