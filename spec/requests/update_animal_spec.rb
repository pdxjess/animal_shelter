require "rails_helper"

describe 'the update animal endpoint', type: :request do
  let!(:animal) { FactoryBot.create(:animal) }

  before do
    patch "animals/#{animal.id}", params: { name: "Ein" }
  end

  it "returns a confirmation message" do
    expect(JSON.parse(response.body)['message']).to eq("Animal with id=#{animal.id} updated successfully.")
  end

  it "returns the updated animal object" do
    result = JSON.parse(response.body)
    expect(result['animal']['name']).to eq('Ein')
    expect(result['animal']['id']).to eq(animal.id)
  end

  it "returns status 200" do
    expect(response).to have_http_status(:success)
  end

  it "updates animal information in database" do
    expect(Animal.find(animal.id).name).to eq('Ein')
  end

  it "returns status 404 if animal cannot be found" do
    patch "animals/#{animal.id + 1}", params: { name: "Ein" }
    expect(response).to have_http_status(:not_found)
  end

  it "returns status 422 if animal cannot be updated" do
    patch "animals/#{animal.id}", params: { birthday: Date.today.next_day }
    expect(response).to have_http_status(:unprocessable_entity)
  end
end
