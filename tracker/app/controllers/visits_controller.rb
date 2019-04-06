class VisitsController < ApplicationController
  def index
    @visits = Visit.order(created_at: :desc).limit(50)
  end
end
