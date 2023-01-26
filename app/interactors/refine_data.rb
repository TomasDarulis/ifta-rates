class RefineData
  include Interactor

  delegate :ifta_rate, :valid_rows, to: :context

  def call
    context.valid_rows = valid_rows
    context.fail!(message: ifta_rate.errors.messages.to_sentence) unless ifta_rate.complete!(rates: valid_rows)
  end

  private

  def valid_rows
    StatesAndAbbreviations::STATES.map do |state|
      row = context.rows.find { |row| row.join('').downcase.match?(state[:name].downcase) }
      state_name = state[:abbreviation]

      next { state_name => 0.0 } if row.blank?

      rate = row[3].match(/\d+\.\d+/).try(:[], 0).to_f

      { state_name => rate }
    end.reduce({}, :merge)
  end
end
