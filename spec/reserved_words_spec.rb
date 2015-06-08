require 'spec_helper'

RSpec.describe ReservedWords do
  before { ReservedWords.clear! }

  describe '.list' do
    it 'returns initial reserved words' do
      expect(ReservedWords.list).to eq %w(admin api image rss www)
    end
  end

  describe '.add' do
    context 'when a word is passed' do
      it 'adds the word to reserved words' do
        ReservedWords.add('blog')
        expect(ReservedWords.list).to eq %w(admin api blog image rss www)
      end
    end

    context 'when words are passed' do
      it 'adds the words to reserved words' do
        ReservedWords.add(%w(blog public))
        expect(ReservedWords.list).to eq %w(admin api blog image public rss www)
      end
    end
  end

  describe '.remove' do
    it 'removes the word from reserved words' do
      ReservedWords.remove('rss')
      expect(ReservedWords.list).to eq %w(admin api image www)
    end
  end
end
