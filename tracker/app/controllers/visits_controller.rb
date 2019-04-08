class VisitsController < ApplicationController
  def index
    @presenter = Visits::IndexPresenter.new
  end

  def create
    @form = VisitCreateForm.new(visit_params)

    if @form.save
      head :ok
    else
      head :unprocessable_entity
    end
  end

  private

  def visit_params
    params.permit(:guid, :url, :accessed_at)
  end
end
