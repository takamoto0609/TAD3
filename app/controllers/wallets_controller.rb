class WalletsController < ApplicationController
  def index
    @codes = Code.where(user_id: current_user.id)
    @cps = ChangePoint.where(user_id: current_user.id)
  end
end
