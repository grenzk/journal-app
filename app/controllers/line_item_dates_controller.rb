class LineItemDatesController < ApplicationController
  before_action :set_category
  before_action :set_line_item_date, only: %i[edit update destroy]

  def new
    @line_item_date = @category.line_item_dates.build
  end

  def create
    @line_item_date = @category.line_item_dates.build(line_item_date_params)

    if @line_item_date.save
      respond_to do |format|
        format.html do
          redirect_to category_path(@category),
                      notice: 'Date was successfully created.'
        end
        format.turbo_stream do
          flash.now[:notice] = 'Date was successfully created.'
        end
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @line_item_date.update(line_item_date_params)
      redirect_to category_path(@category),
                  notice: 'Date was successfully created'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @line_item_date.destroy

    redirect_to category_path(@category),
                notice: 'Date was successfully destroyed.'
  end

  private

  def set_line_item_date
    @line_item_date = @category.line_item_dates.find(params[:id])
  end

  def line_item_date_params
    params.require(:line_item_date).permit(:date)
  end

  def set_category
    @category = current_admin.categories.find(params[:category_id])
  end
end