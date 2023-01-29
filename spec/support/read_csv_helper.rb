require 'csv'
require 'open-uri'

module ReadCsvHelper
  def read_csv(file_path)
    rows = CSV.read(file_path)
  end
end
