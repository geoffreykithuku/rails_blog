require 'rails_helper'

RSpec.describe User, type: :model do
 subject {
  User.new(email: "", password: "password", password_confirmation: "password")
 }
 it "is not valid without an email" do
  expect(subject).to_not be_valid
 end
end
