class ItemsController < ApplicationController
  def index
  end

  def new
    if user_signed_in?
      @item = Item.new
    else
      redirect_to new_user_session_path
    end
  end

  def create
    @item = Item.new(item_params)
    if @item.valid?
      @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item                    = Item.find(params[:id])
  end

  def search
    if params[:input_name].present?
      @items = Item.where('name LIKE ?', "%#{params[:input_name]}%")
    else
      @items = Item.none
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :point, :comment, :place, :stock, :user_id,).merge(user_id: current_user.id)
  end
end
