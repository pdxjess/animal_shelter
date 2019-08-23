require "rails_helper"

describe Animal do
  it { should validate_presence_of :name }
  it { should validate_presence_of :species }
  it { should validate_presence_of :sex }
  it { should validate_presence_of :birthday }
