class CategoriesController < ApplicationController
  before_action :set_category, only: %i[show edit update destroy]

  def index
    @categories = current_admin.categories.ordered
  end

  def show
  end

  def new
    @category = Category.new
  end

  def create
    @category = current_admin.categories.build(category_params)

    if @category.save
      respond_to do |format|
        format.html do
          redirect_to categories_path,
                      notice: 'Category was successfully created.'
        end
        format.turbo_stream
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @category.update(category_params)
      redirect_to categories_path, notice: 'Category was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @category.destroy

    respond_to do |format|
      format.html do
        redirect_to categories_path,
                    notice: 'Category was successfully deleted.'
      end
      format.turbo_stream
    end
  end

  private

  def set_category
    @category = current_admin.categories.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end
end
