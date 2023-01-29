require 'rails_helper'

RSpec.describe IftaRatesController, type: :controller do
  describe "GET #index" do
    context 'when data is present' do
      let(:ifta_rates) { create_list(:ifta_rate, 5) }

      before do
        allow(IftaRate).to receive(:all).and_return(ifta_rates)
      end

      it "returns http success" do
        get :index
        expect(response).to have_http_status(:success)
      end

      it "assigns @ifta_rate_props" do
        get :index
        expect(assigns(:ifta_rate_props)).to eq({ ifta_rates: ifta_rates })
      end
    end
  end
end

