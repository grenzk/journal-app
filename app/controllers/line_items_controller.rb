class LineItemsController < ApplicationController
  before_action :set_category
  before_action :set_line_item_date

  def new
    @line_item = @line_item_date.line_items.build
  end

  def create
    @line_item = @line_item_date.line_items.build(line_item_params)

    if @line_item.save
      redirect_to category_path(@category),
                  notice: 'Task was succesfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def line_item_params
    params.require(:line_item).permit(:name, :description)
  end

  def set_category
    @category = current_admin.categories.find(params[:category_id])
  end

  def set_line_item_date
    @line_item_date = @category.line_item_dates.find(params[:line_item_date_id])
  end
end
