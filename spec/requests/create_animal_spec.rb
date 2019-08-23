require "rails_helper"

describe 'the create animal endpoint', type: :request do
  before do
    post 'animals', params: {
      name: 'Ravenna',
      species: 'Cat',
      sex: 'F',
      birthday: Date.today - 1.year,
      description: 'An elegant and calm black cat.',
      arrival_date: Date.today - 7.day
    }
  end

  it "returns a confirmation message" do
    expect(JSON.parse(response.body)['message']).to_not eq(nil)
  end

  it "returns created animal object" do
    result = JSON.parse(response.body)
    expect(result['animal']['id']).to_not be(nil)
    expect(result['animal']['name']).to eq('Ravenna')
  end

  it "returns status 201" do
    expect(response).to have_http_status(:created)
  end

  it "creates new animal record in the database" do
    expect(Animal.all.length).to eq(1)
    expect(Animal.first.name).to eq('Ravenna')
  end

  it "returns status 422 if animal cannot be saved" do
    post 'animals'
    expect(response).to have_http_status(:unprocessable_entity)
  end
end
