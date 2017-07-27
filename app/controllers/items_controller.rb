class ItemsController < ApplicationController
  before_action :load_items, only: :index
  before_action :load_item, only: :show
  before_action :new_item, only: :create

  def index
  end

  def new
  end

  def edit
  end

  def create
    if new_item.save
      redirect_to items_path
    else
      redirect_to new_item_path
    end
  end

  def show
  end

  def destroy
  end

  private

  def load_items
    @items = Item.all
  end

  def load_item
    @item = Item.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to items_path
  end

  def new_item
    @item = Item.new(name: params[:name], description: params[:description])
  end
end
