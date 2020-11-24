class ChatsController < ApplicationController
  # binding.pry

  def new
    if user_signed_in?
      @chat = Chat.new
      @item = Item.find_by(id: params[:item_id])
      @chats = Chat.where(item_id: params[:item_id])
    else
      redirect_to new_user_session_path
    end
  end

  def create
    if Chat.new(chat_params).valid?
      Chat.create(chat_params)
      redirect_to new_item_chat_path(params[:item_id])
    else
      redirect_to new_item_chat_path(params[:item_id])
    end
  end

  private

  def chat_params
    params.require(:chat).permit(:message).merge(user_id: current_user.id).merge(item_id: params[:item_id])
  end
end
