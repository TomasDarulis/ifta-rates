require 'rails_helper'

RSpec.describe IftaRate, type: :model do
  include ReadCsvHelper
  include RefineDataHelper

  let(:ifta_rate) { create(:ifta_rate) }
  let(:file_path) { 'spec/fixtures/ifta_rate_data.csv' }
  let(:data) { read_csv(file_path) }
  let(:rates) { refine_data(data) }

  describe '#complete!' do
    it 'sets rates and status' do
      expect {
        ifta_rate.complete!(rates: rates)
      }.to change { ifta_rate.reload.rates }.from({}).to(rates)
       .and change { ifta_rate.reload.status }.from("").to("completed")
    end

    describe '#fail!' do
      it 'sets status and an error message' do
        expect {
          ifta_rate.fail!(message: "404")
        }.to change { ifta_rate.reload.status }.from("").to("error")
         .and change { ifta_rate.reload.error}.from("").to("404")
      end
    end
  end
end
