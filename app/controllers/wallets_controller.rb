class WalletsController < ApplicationController
  def index
    @codes = Code.where(user_id: current_user.id)
  end

  def point_to_code #point_to_code_wallets_path
  end
# 不要
  def code_to_point #code_to_point_wallets_path
  end
end
