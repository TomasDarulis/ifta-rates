require 'rails_helper'

RSpec.describe IftaRateDataOrganizer do
  include ActiveStorage::Blob::Analyzable
  include ReadCsvHelper
  include RefineDataHelper

  let(:ifta_rate) { create(:ifta_rate) }
  let(:file_path) { 'spec/fixtures/ifta_rate_data.csv' }
  let(:rows) { read_csv(file_path) }
  let(:rates) { refine_data(rows) }
  subject(:organizer) { described_class.call(year: ifta_rate.year, quarter: ifta_rate.quarter, url: file_path) }

  context 'when file is downloaded successfully' do
    it 'creates ifta rate, attaches the file and sets rates' do
      expect { organizer }.to change(IftaRate, :count).by(1)
      new_ifta_rate = IftaRate.last
      expect(new_ifta_rate.status).to eq('completed')
      expect(new_ifta_rate.rates).to eq(rates)
      expect(new_ifta_rate.file).to be_attached
    end
  end
end

