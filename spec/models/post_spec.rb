require 'rails_helper'

RSpec.describe Post, type: :model do
  # tests for the post model. it should have a user, title, and content

  subject { Post.new(title: "Title", content: "Content") }

  it "is valid with valid attributes" do
    expect(subject).to be_invalid
  end

  it "is not valid without a title" do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without content" do
    subject.content = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a user" do
    subject.user = nil
    expect(subject).to_not be_valid
  end


end
