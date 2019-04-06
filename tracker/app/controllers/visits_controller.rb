class VisitsController < ApplicationController
  protect_from_forgery with: :null_session

  def index
    @visits = Visit.order(created_at: :desc).limit(50)
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
