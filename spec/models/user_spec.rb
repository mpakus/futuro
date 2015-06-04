require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is check empty user name' do
    user = build(:user, name: nil)
    user.valid?
    expect(user.errors[:name]).to include("can't be blank")
  end

  it 'is check empty user uri because of empty name too' do
    user = build(:user, name: nil, uri: nil)
    user.valid?
    expect(user.errors[:uri]).to include("can't be blank")
  end

  it 'is check uniq uri for user' do
    attrs = attributes_for(:user, uri: 'hell-of-wheels')
    User.create(attrs)
    user  = User.new(attrs)
    user.valid?
    expect(user.errors[:uri]).to include('has already been taken')
  end
end
