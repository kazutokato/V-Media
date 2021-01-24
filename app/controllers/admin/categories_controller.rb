class Admin::CategoriesController < ApplicationController

  def index
    @category_new = Category.new
    @categories = Category.all
  end

  def create
    @category_new = Category.new(category_params)
    @category_new.save
    redirect_to admin_categories_path
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    @category.update(category_params)
    redirect_to admin_categories_path
  end
  
  private
  
  def category_params
    params.require(:category).permit(:medium, :feature, :speed)
  end
end
