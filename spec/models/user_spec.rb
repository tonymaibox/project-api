require 'rails_helper'

describe User, type: :model do
let(:user1) { User.new(username: "vronnieli", first_name: "veronica", last_name: "li", email: "vronnieli@mail.com", password: "password") }
let(:user2) { User.new() }
let(:user3) { User.new(username: "vronnieli", first_name: "veronica", last_name: "li", email: "vronnieli@mail.com", password: "password") }

  it 'is valid with a username' do
    expect(user1).to be_valid
    expect(user1.username).to eq("vronnieli")
    user2.valid?
    expect(user2.errors[:username]).to include("can't be blank")
  end

  it 'is valid with an email' do
    expect(user1).to be_valid
    expect(user1.email).to eq("vronnieli@mail.com")
    user2.valid?
    expect(user2.errors[:email]).to include("can't be blank")
  end

  it 'is valid with a first name' do
    expect(user1).to be_valid
    expect(user1.first_name).to eq("veronica")
    user2.valid?
    expect(user2.errors[:first_name]).to include("can't be blank")
  end

  it 'is valid with a last name' do
    expect(user1).to be_valid
    expect(user1.last_name).to eq("li")
    user2.valid?
    expect(user2.errors[:last_name]).to include("can't be blank")
  end

  it 'is valid with a password' do
    expect(user1).to be_valid
    expect(user1.password).to eq("password")
    user2.valid?
    expect(user2.errors[:password]).to include("can't be blank")
  end

  it 'is valid with a unique username' do
    user1.save
    expect(user1).to be_valid
    user3.valid?
    expect(user3.errors[:username]).to include("has already been taken")
  end

end
