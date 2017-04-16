# frozen_string_literal: true

class Block
  def blockable
    Block::Text.new
  end
end
class Block::Text
end

RSpec.describe ApplicationHelper, type: :helper do
  describe '.form_errors' do
    let(:form) { FactoryGirl.build(:user, email: nil, password: nil) }
    subject do
      form.valid?
      form_errors(form)
    end

    it { is_expected.to include 'alert-danger' }

    context 'with fields' do
      it { is_expected.to include t('activerecord.errors.models.user.attributes.email.blank') }
      it { is_expected.to include t('activerecord.errors.models.user.attributes.password.blank') }
    end

    context 'when parameter is nil' do
      it 'returns empty string' do
        expect(form_errors(nil)).to be_empty
      end
    end

    context 'when parameter is not nil and not ActiveRecord' do
      it 'raise error NoMethodError' do
        expect { form_errors('WRONG_PARAM') }.to raise_error NoMethodError
      end
    end
  end

  describe '.flash_message' do
    subject { flash_message(flash) }

    context 'with notice' do
      let(:flash) { { notice: Faker::Lorem.sentence(5) } }

      it { is_expected.to include flash[:notice] }
      it { is_expected.to include 'alert-success' }
    end

    context 'with alert' do
      let(:flash) { { alert: Faker::Lorem.sentence(5) } }

      it { is_expected.to include flash[:alert] }
      it { is_expected.to include 'alert-danger' }
    end
  end

  describe '.title' do
    before { @view_flow = ActionView::OutputFlow.new }
    it 'yield title' do
      text = 'Hello'
      title(text)
      expect(helper.content_for(:title)).to eq text
    end

    it 'strip tags' do
      text = '<p>Hello <br/>World!</p>'
      title(text)
      expect(helper.content_for(:title)).to eq 'Hello World!'
    end
  end

  describe '.post_block_template' do
    it 'returns string with class name' do
      expect(post_block_template(Block.new)).to eq 'futuro/posts/blocks/text/form'
    end
    it 'returns 2nd argument template' do
      expect(post_block_template(Block.new, 'show')).to eq 'futuro/posts/blocks/text/show'
    end
  end

  describe '.clean_text' do
    let(:text) { '<h1>Hello</h1> <div>World!</div> <img src="http://aomega.co/logo.png" /> <Script>alert("BAD!")</script>' }
    it 'remove bad tags' do
      expect(clean_text(text)).to_not include 'script'
    end
    it 'leave right tags' do
      expect(clean_text(text)).to include '<h1>'
      expect(clean_text(text)).to include '<div>'
      expect(clean_text(text)).to include 'img'
    end
  end
end
