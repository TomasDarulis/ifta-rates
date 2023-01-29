desc "Fetch Ifta Rates"
task :fetch_ifta_rates, [:year, :quarter] => :environment do |t, args|
  current_year = args[:year].to_i
  current_quarter = args[:quarter].to_i
  context = {year: current_year, quarter: current_quarter}

  IftaRateDataOrganizer.call(context)
end
