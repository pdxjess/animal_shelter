require "rails_helper"

describe 'the get an animal endpoint', type: :request do
  let!(:animal) { FactoryBot.create(:animal) }

  before do
    get "animals/#{animal.id}"
  end

  it "returns the animal with the given id" do
    animal_result = JSON.parse(response.body)
    expect(animal_result['name']).to eq(animal.name)
    expect(animal_result['id']).to eq(animal.id)
  end

  it "returns status code 200" do
    expect(response).to have_http_status(:success)
  end

  it "returns status code 404 if animal cannot be found" do
    get "animals/#{animal.id + 1}"
    expect(response).to have_http_status(:not_found)
  end
