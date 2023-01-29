require 'interactor'
require 'open-uri'

class SaveFile
  include Interactor

  FILE_URL = "https://www.iftach.org/taxmatrix/charts"

  delegate :ifta_rate, :url, :quarter, :year, to: :context
  before :file_url

  def call
    save_file
  end

  private

  def save_file
    begin
      file = open(url)

      ifta_rate.file.attach(io: file, filename: "ifta-rates-#{quarter}Q#{year}.csv", content_type: 'application/csv')
      context.rows = CSV.read(file)
    rescue OpenURI::HTTPError => e
      ifta_rate.fail!(message: "Failed: #{e.message}")
      context.fail!
    end
  end

  def file_url
    context.url ||= "#{FILE_URL}/#{context.quarter}Q#{context.year}.csv"
  end
end
