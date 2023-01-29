require 'rails_helper'
require 'webmock/rspec'

RSpec.describe SaveFile do
  include ReadCsvHelper
  include ActiveStorage::Blob::Analyzable

  describe '.call' do
    let(:ifta_rate) { create(:ifta_rate) }
    let(:url) { 'https://www.iftach.org/taxmatrix/charts/1Q2022.csv' }
    let(:file_path) { 'spec/fixtures/ifta_rate_data.csv' }
    let(:body) { read_csv(file_path) }

    context 'interactor suceeds' do
      subject(:interactor) { described_class.call(ifta_rate: ifta_rate, url: file_path) }

      it 'succeeds' do
        expect(interactor).to be_a_success
      end

      it 'sets context rows' do
        expect(interactor.rows).to eq(body)
      end

      it 'attaches the file' do
        interactor
        expect(ifta_rate.file).to be_attached
      end
    end

    context 'when interactor fails' do
      subject(:interactor) { described_class.call(ifta_rate: ifta_rate, url: url) }

      before do
        stub_request(:get, url).to_return(status: 404)
      end

      it 'fails' do
        expect(interactor).to be_a_failure
      end

      it 'sets status to error' do
        expect { interactor }.to change { ifta_rate.reload.status}.from("").to("error")
      end

      it 'does not attach file' do
        expect(ifta_rate.file).not_to be_attached
      end
    end
  end
end
