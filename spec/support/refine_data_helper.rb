require 'csv'
require 'open-uri'

module RefineDataHelper

  def refine_data(rows)
    StatesAndAbbreviations::STATES.map do |state|
      row = rows.find { |row| row.join('').downcase.match?(state[:name].downcase) }
      state_name = state[:abbreviation]

      next { state_name => 0.0 } if row.blank?

      rate = row[3]&.match(/\d+\.\d+/).try(:[], 0).to_f

      { state_name => rate }
    end.reduce({}, :merge)
  end
end
