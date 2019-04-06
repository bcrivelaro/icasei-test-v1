class VisitCreateForm
  include ActiveModel::Model

  attr_accessor :guid, :url, :accessed_at, :visit

  validates :guid, :url, :accessed_at, presence: true
  validate :accessed_at_format

  def initialize(visit_params)
    @guid        = visit_params[:guid]
    @url         = visit_params[:url]
    @accessed_at = visit_params[:accessed_at]
  end

  def save
    return unless valid?

    @visit = Visit.create!(
      guid: guid,
      url: url,
      accessed_at: accessed_at
    )
  end

  private

  def accessed_at_format
    return if accessed_at.blank?
    return if parsed_accessed_at

    errors.add(:accessed_at, 'is invalid')
  end

  def parsed_accessed_at
    begin
      DateTime.parse(accessed_at)
    rescue ArgumentError
      false
    end
  end
end