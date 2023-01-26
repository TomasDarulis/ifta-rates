class IftaRatesController < ApplicationController
  def index
    @ifta_rate_props = { ifta_rates: [IftaRate.all] }
  end
end
