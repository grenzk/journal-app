class LineItemDatesController < ApplicationController
  before_action :set_category

  def new
    @line_item_date = @category.line_item_dates.build
  end

  def create
    @line_item_date = @category.line_item_dates.build(line_item_date_params)

    if @line_item_date.save
      redirect_to category_path(@category),
                  notice: 'Date was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def line_item_date_params
    parans.require(:line_item_date).permit(:date)
  end

  def set_category
    @category = current_admin.categories.find(params[:category_id])
  end
end
