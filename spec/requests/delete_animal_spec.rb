require "rails_helper"

describe 'the delete animal endpoint', type: :request do
  let!(:animal) { FactoryBot.create(:animal) }

  before do
    delete "animals/#{animal.id}"
  end

  it "returns a confirmation message" do
    expect(JSON.parse(response.body)['message']).to eq("Animal with id=#{animal.id} deleted successfully.")
  end

  it "returns status 200" do
    expect(response).to have_http_status(:success)
  end

  it "removes animal from database" do
    expect(Animal.all).to eq([])
  end

  it "returns status 404 if animal cannot be found" do
    delete "animals/#{animal.id + 1}"
    expect(response).to have_http_status(:not_found)
  end
end
