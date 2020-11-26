class CodesController < ApplicationController
  def new
    @code = Code.new
  end

  def create
    # binding.pry
    @message_2 = ""
    current_user.wallet.point = current_user.wallet.point - code_params[:point].to_i
    if current_user.wallet.point >= 0 && Code.new(code_params).valid?
      Code.create(code_params)
      current_user.wallet.save
      redirect_to wallets_path
    elsif current_user.wallet.point < 0
      @message_1 = "ポイントが足りません"
      code_create_error
    elsif current_user.wallet.point >= 0
      if code_params[:point].to_i <0
        @message_1 = "マイナスは無理です"
        code_create_error
      elsif code_params[:point] == ""
        @message_1 = "ポイントを入力してください"
        code_create_error
      else
        @message_1 = "そのコードは使えません"
        code_create_error
      end
    end
  end

  private

  def code_params
    params.require(:code).permit(:point, :pass).merge(user_id: current_user.id)
  end

  def code_create_error
    current_user.wallet.point = current_user.wallet.point + code_params[:point].to_i
    @codes = Code.where(user_id: current_user.id)
    @cps = ChangePoint.where(user_id: current_user.id)
    @cp = ChangePoint.new
    @code = Code.new
    render "wallets/index"
  end
end
