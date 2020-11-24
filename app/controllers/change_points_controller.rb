class ChangePointsController < ApplicationController
  def new
    @cp = ChangePoint.new
  end

  def create
    # binding.pry
    code = Code.find_by(id: Code.where(pass: params[:change_point][:pass]).pluck(:id))
    if code != nil && code.used == false
      ChangePoint.create(cp_params)
      current_user.wallet.point = current_user.wallet.point + code.point
      current_user.wallet.save
      code.used = true
      code.save
      redirect_to wallets_path
    else
      @message = "ポイント化できませんでした"
      @cp = ChangePoint.new
      render :new
    end
  end

  private

  def cp_params
    code = Code.find_by(id: Code.where(pass: params[:change_point][:pass]).pluck(:id))
    params.require(:change_point).permit(:pass).merge(user_id: current_user.id).merge(point: code.point)
  end
end
