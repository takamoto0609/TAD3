class ChatsController < ApplicationController
  # binding.pry

  def index
    if user_signed_in?
      @item = Item.find_by(id: params[:item_id])
      @chats = Chat.where(item_id: params[:item_id])
    else
      redirect_to new_user_session_path
    end
  end

  def new
    @chat = Chat.new
  end

  def create
    if params[:message]=""
      redirect_to item_chats_path(params[:item_id])
    else
      chat = Chat.create(chat_params)
      redirect_to item_chats_path(params[:item_id])
    end
  end

  private

  def chat_params
    params.permit(:message).merge(user_id: current_user.id).merge(item_id: params[:item_id].to_i)
  end
end
