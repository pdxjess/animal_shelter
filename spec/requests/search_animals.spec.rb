require "rails_helper"

describe 'the animal search path', type: :request do
  let!(:animal1) { FactoryBot.create(:animal, name: 'Cathy') }
  let!(:animal2) { FactoryBot.create(:animal, species: 'Cat') }
  let!(:animal3) { FactoryBot.create(:animal, description: 'Gets along with cats, other dogs.') }
  let!(:animal4) { FactoryBot.create(:animal) }

  before do
    get 'animals/search', params: { term: 'cat' }
  end

  it "returns all animals with a name, description, or species that partially match the search term" do
    expect(JSON.parse(response.body).size).to eq(3)
  end

  it "returns status 200" do
    expect(response).to have_http_status(:success)
  end

  it "searches only animals who arrived over 6 months ago if long_term is set to 'true'" do
    animal5 = FactoryBot.create(:animal, species: 'cat', arrival_date: Date.today - 8.month)
    get 'animals/search', params: { term: 'cat', long_term: 'true' }
    result = JSON.parse(response.body)
    expect(result.first['id']).to eq(animal5.id)
    expect(result.size).to eq(1)
  end
end
