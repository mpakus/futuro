# frozen_string_literal: true
RSpec.describe User, type: :model do
  context 'with validation' do
    it 'check empty name' do
      user = FactoryGirl.build(:user, name: nil)
      user.valid?
      expect(user.errors[:name]).to include(t('activerecord.errors.models.user.attributes.name.blank'))
    end

    it 'check empty user uri because of empty name too' do
      user = FactoryGirl.build(:user, name: nil, uri: nil)
      user.valid?
      expect(user.errors[:uri]).to include(t('activerecord.errors.models.user.attributes.uri.blank'))
    end

    it 'check uniq uri' do
      attrs = FactoryGirl.attributes_for(:user, uri: 'hell-on-wheels')
      User.create(attrs)
      user = User.new(attrs)
      user.valid?
      expect(user.errors[:uri]).to include(t('activerecord.errors.models.user.attributes.uri.taken'))
    end

    it 'check length of name' do
      user = FactoryGirl.build(:user, name: 'MpaK' * 100)
      user.valid?
      expect(user.errors[:name]).to include('is too long (maximum is 255 characters)')
    end

    it 'check length of uri' do
      user = FactoryGirl.build(:user, uri: 'mpak' * 100)
      user.valid?
      expect(user.errors[:uri]).to include('is too long (maximum is 255 characters)')
    end
  end
end
