require 'rails_helper'

describe User, type: :model do
let(:user1) { User.new(username: "vronnieli", first_name: "veronica", last_name: "li", email: "vronnieli@mail.com", password: "password") }
let(:user2) { User.new() }
let(:user3) { User.new(username: "vronnieli", first_name: "veronica", last_name: "li", email: "vronnieli@mail.com", password: "password") }

  it 'is valid with a username' do
    expect(user1).to be_valid
    expect(user1.username).to eq("vronnieli")
    expect(user2).to_not be_valid
  end

  it 'is valid with an email' do
    expect(user1).to be_valid
    expect(user1.email).to eq("vronnieli@mail.com")
    expect(user2).to_not be_valid
  end

  it 'is valid with a first name' do
    expect(user1).to be_valid
    expect(user1.first_name).to eq("veronica")
    expect(user2).to_not be_valid
  end

  it 'is valid with a last name' do
    expect(user1).to be_valid
    expect(user1.last_name).to eq("li")
    expect(user2).to_not be_valid
  end

  it 'is valid with a password' do
    expect(user1).to be_valid
    expect(user1.password).to eq("password")
    expect(user2).to_not be_valid
  end

  it 'is valid with a unique username' do
    expect(user1).to be_valid
    expect(user3).to_not be_valid
  end

end
