require "rails_helper"

describe 'the get animals endpoint', type: :request do
  let!(:animals) { FactoryBot.create_list(:animal, 10) }

  before do
    get 'animals'
  end

  it "returns all animals" do
    expect(JSON.parse(response.body).size).to eq(10)
  end

  it "returns status code 200" do
    expect(response).to have_http_status(:success)
  end

  it "returns only animals that arrived at the shelter more than 6 months ago if 'long_term' is marked true" do
    FactoryBot.create(:animal, arrival_date: Date.today - 7.month)
    get 'animals', params: { long_term: 'true' }
    expect(JSON.parse(response.body).size).to eq(1)
  end
end
