class CategoriesController < ApplicationController
  before_action :set_category, only: %i[show edit update destroy]

  def index
    @categories = current_admin.categories.ordered
  end

  def show
    @line_item_dates = @category.line_item_dates.ordered
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
        format.turbo_stream do
          flash.now[:notice] = 'Category was successfully created.'
        end
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @category.update(category_params)
      respond_to do |format|
        format.html do
          redirect_to categories_path,
                      notice: 'Category was successfully updated.'
        end
        format.turbo_stream do
          flash.now[:notice] = 'Category was successfully updated.'
        end
      end
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
      format.turbo_stream do
        flash.now[:notice] = 'Category was successfully deleted.'
      end
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
