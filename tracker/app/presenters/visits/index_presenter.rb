class Visits::IndexPresenter
  def visits
    @visits = Visit.order(created_at: :desc).limit(50)
  end

  def page_title
    "Visits"
  end
end