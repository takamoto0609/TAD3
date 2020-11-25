class WalletsController < ApplicationController
  def index
    if user_signed_in?
      @codes = Code.where(user_id: current_user.id)
      @cps = ChangePoint.where(user_id: current_user.id)
    else
      redirect_to new_user_session_path
    end
  end
end
