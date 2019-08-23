require "rails_helper"

describe 'the random animal endpoint', type: :request do
  let!(:animals) { FactoryBot.create_list(:animal, 10) }

  before do
    get 'animals/random'
  end

  it "returns a single animal object" do
    expect(JSON.parse(response.body)['name']).to_not eq(nil)
  end

  it "returns status code 200" do
    expect(response).to have_http_status(:success)
  end

  it "returns a random animal that has been at the shelter more than 6 months if long_term is set to 'true'" do
    animal = FactoryBot.create(:animal, arrival_date: Date.today - 7.month)
    get 'animals/random', params: { long_term: 'true' }
    result = JSON.parse(response.body)
    expect(Date.parse(result['arrival_date']) < Date.today - 6.month).to eq(true)
  end
end
