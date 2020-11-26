class ItemsController < ApplicationController
  def index
    @items = Item.all
    gon.items = @items
    @item = Item.new
  end

  def new
    if user_signed_in?
      @item = Item.new
    else
      redirect_to new_user_session_path
    end
  end

  def create
    if user_signed_in?
      @item = Item.new(item_params)
      if @item.name != "" && @item.point != nil && @item.stock != nil && @item.address != "" && @item.comment != ""
        @item.save
        redirect_to root_path
      else
        @message = "登録に失敗しました"
        @items = Item.all
        gon.items = @items
        @item = Item.new
        render "items/index"
      end
    else
      redirect_to new_user_session_path
    end
  end

  def show
    @items = Item.all
    @item = Item.find(params[:id])
    gon.item = @item
  end

  def search
    if params[:input_name].present?
      @items = Item.where('name LIKE ?', "%#{params[:input_name]}%")
      .or(Item.where('address LIKE ?', "%#{params[:input_name]}%"))
      gon.items = @items
    else
      @items = Item.none
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :point, :comment, :address, :stock, :user_id, :latitude, :longitude).merge(user_id: current_user.id)
  end
end
