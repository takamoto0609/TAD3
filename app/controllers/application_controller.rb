class ApplicationController < ActionController::Base
  before_action :get_new_wallet

  private

  def get_new_wallet
    if user_signed_in?
      wallet = Wallet.find_by(user_id: current_user.id)
      if wallet == nil
        new_wallet = Wallet.new
        new_wallet.user_id = current_user.id
        new_wallet.save
      end
    end
  end
end
