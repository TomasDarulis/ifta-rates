require 'rails_helper'
require 'open-uri'
require 'csv'
require 'webmock/rspec'

RSpec.describe ReadCsv do
  include ReadCsvHelper

  describe '.call' do
    let(:ifta_rate) { double(:ifta_rate, year: year, quarter: quarter) }
    let(:file) { 'spec/fixtures/ifta_rate_data.csv' }
    let(:rows) { read_csv(file) }
    subject(:context) { described_class.call(file: file) }

    it 'succeeds' do
      expect(context).to be_a_success
    end

    it 'it sets context with data' do
      expect(context.rows).to eq(rows)
    end
  end
end

