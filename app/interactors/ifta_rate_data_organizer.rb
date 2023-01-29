require_relative 'save_file'
require_relative 'refine_data'

class IftaRateDataOrganizer
  include Interactor::Organizer

  delegate :year, :quarter, to: :context
  before :set_ifta_rate

  organize SaveFile, RefineData

  private

  def set_ifta_rate
    context.ifta_rate = IftaRate.find_or_create_by(year: year, quarter: quarter)
  end
end
