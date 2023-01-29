require 'rails_helper'

RSpec.describe RefineData do
  include ReadCsvHelper
  include RefineDataHelper

  describe '.call' do
    let(:file_path) { 'spec/fixtures/ifta_rate_data.csv' }
    let(:rows) { read_csv(file_path) }
    let(:rates) { refine_data(rows) }
    let(:ifta_rate) { create(:ifta_rate) }
    subject(:interactor) { described_class.call(valid_rows: rates, ifta_rate: ifta_rate, rows: rows) }

    context 'when interactor succeeds' do
      it 'succeeds' do
        expect(interactor).to be_a_success
      end

      it 'sets rates' do
        expect { interactor }.to change { ifta_rate.reload.rates }.from({}).to(rates)
      end
    end

    context 'when interactor fails' do
      before do
        allow(ifta_rate).to receive(:complete!).and_return(false)
      end

      it 'fails' do
        expect(interactor).to be_a_failure
      end

      it 'updates status' do
        expect { interactor }.to change { ifta_rate.reload.status }.from("").to("error")
      end

      it 'does not set rates' do
        expect { interactor }.not_to change { ifta_rate.reload.rates }.from({})
      end
    end
  end
end
