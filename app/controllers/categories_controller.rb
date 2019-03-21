class CategoriesController < ApplicationController

  before_action :set_categorie, only: [:edit, :show, :update, :destroy]

  def index
    @user = session[:user_name]
    @categories = Category.all
  end

  def create
    if @category = Category.create(category_params)
        redirect_to  category_path(@category.id)
    else
        render 'preoweb'
    end
  end

  def show
  end

  def update
    @category.update(category_params)
  end

  def destroy
    @category.destroy
    redirect_to categories_path
  end

  def new
    @category = Category.new
  end

  def edit
  end

  private

  def category_params
    params.require(:category).permit(:name, :slug)
  end

  def set_categorie
    @category = Category.find(params[:id])

  end
end
