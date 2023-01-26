require 'interactor'
require 'open-uri'
require 'csv'

class ReadCsv
  include Interactor

  FILE_URL = "https://www.iftach.org/taxmatrix/charts"
  delegate :ifta_rate, to: :context


  def call
    read_file(file_url)
  end

  private

  def read_file(file_url)
    begin
      rows = CSV.read(open(file_url))

      context.rows = rows
    rescue OpenURI::HTTPError => e
      ifta_rate.fail!(message: "Failed: #{e.message}")
      context.fail!
    end
  end

  def file_url
    file_url ||= "#{FILE_URL}/#{context.quarter}Q#{context.year}.csv"
  end
end
