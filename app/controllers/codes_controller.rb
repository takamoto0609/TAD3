class CodesController < ApplicationController
  def new
    @code = Code.new
  end

  def create
    # binding.pry
    @message = ""
    current_user.wallet.point = current_user.wallet.point - code_params[:point].to_i
    if current_user.wallet.point >= 0 && Code.new(code_params).valid?
      Code.create(code_params)
      current_user.wallet.save
      redirect_to wallets_path
    else
    current_user.wallet.point = current_user.wallet.point + code_params[:point].to_i
    @message = "コードが作成できませんでした"
    @code = Code.new
    render :new
    end
  end

  private

  def code_params
    params.require(:code).permit(:point, :pass).merge(user_id: current_user.id)
  end
end
