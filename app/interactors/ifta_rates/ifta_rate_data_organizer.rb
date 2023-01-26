require_relative 'read_csv'
require_relative 'refine_data'
require_relative 'set_data'

class IftaRateDataOrganizer
  include Interactor::Organizer

  delegate :year, :quarter, to: :context
  before :set_ifta_rate

  organize ReadCsv, RefineData

  private

  def set_ifta_rate
    context.ifta_rate = IftaRate.find_or_create_by(year: year, quarter: quarter)
  end
end
