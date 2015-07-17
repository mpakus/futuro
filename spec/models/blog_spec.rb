require 'rails_helper'

RSpec.describe Blog, type: :model do
  it 'check empty name' do
    blog = build(:blog, name: nil)
    blog.valid?
    expect(blog.errors[:name]).to include("can't be blank")
  end

  it 'check how Blog fill uri from name' do
    blog = create(:blog, name: 'Ninja Kawasaki 1050, Soldiers', uri: nil)
    expect(blog.uri).to eq 'ninja-kawasaki-1050-soldiers'

    blog = create(:blog, name: '1st emperor of the Galaxy!', uri: nil)
    expect(blog.uri).to eq '1st-emperor-of-the-galaxy'
  end

  it 'check empty uri because of empty name too' do
    blog = build(:blog, name: nil, uri: nil)
    blog.valid?
    expect(blog.errors[:uri]).to include("can't be blank")
  end

  it 'check uniq uri' do
    attrs = attributes_for(:blog, uri: 'hell-on-wheels')
    Blog.create(attrs)
    blog  = Blog.new(attrs)
    blog.valid?
    expect(blog.errors[:uri]).to include('has already been taken')
  end

  it 'check length of name' do
    blog = build(:blog, name: 'MpaK' * 100)
    blog.valid?
    expect(blog.errors[:name]).to include('is too long (maximum is 255 characters)')
  end

  it 'check length of uri' do
    blog = build(:blog, uri: 'mpak' * 100)
    blog.valid?
    expect(blog.errors[:uri]).to include('is too long (maximum is 255 characters)')
  end
end
