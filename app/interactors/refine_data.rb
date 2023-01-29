class RefineData
  include Interactor

  delegate :ifta_rate, :refined_data, to: :context
  before :refined_data

  def call
    ifta_rate.fail!(
      message: ifta_rate.errors.full_messages.to_sentence) and
     context.fail! unless ifta_rate.complete!(rates: refined_data)
  end

  private

  def refined_data
    StatesAndAbbreviations::STATES.map do |state|
      row = context.rows.find { |row| row.join('').downcase.match?(state[:name].downcase) }
      state_name = state[:abbreviation]

      next { state_name => 0.0 } if row.blank?

      rate = row[3]&.match(/\d+\.\d+/).try(:[], 0).to_f

      { state_name => rate }
    end.reduce({}, :merge)
  end
end
