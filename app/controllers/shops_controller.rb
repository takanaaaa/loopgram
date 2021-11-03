class ShopsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  
  def index
    @shops = Shop.all
  end
  
  def show
    @shop = Shop.find(params[:id])
  end

  def new
    @shop = Shop.new
  end

  def create
    @shop = Shop.new(shop_params)
    @shop.user_id = current_user.id
    if @shop.save
      redirect_to shop_path(@shop), notice: '投稿に成功しました。'
    else
      render :new
    end
  end

  def edit
    @shop = Shop.find(params[:id])
    if @shop.user != current_user
      redirect_to shops_path, alert: '不正なアクセスです。'
    end
  end

  def update
    @shop = Shop.find(params[:id])
    if @shop.update(shop_params)
      redirect_to shop_path(@shop),  notice: '更新に成功しました。'
    else
      render :edit
    end
  end
  
  def destroy
    shop = Shop.find(params[:id])
    shop.destroy
    redirect_to user_path(shop.user), notice: "レシピを削除しました。"
  end

  private
  def shop_params
    params.require(:shop).permit(:title, :shop_address, :body, :image)
  end
end
