# frozen_string_literal: true

require 'spec_helper'
require 'game'
require 'frame'
require 'score'

RSpec.describe Game do
  let(:game) { described_class.new }

  it 'has ten frames' do
    expect(game.frames.size).to eql(10)
  end

  it 'holds a score' do
    expect(game.score).to be_a(Score)
  end

  describe '#play' do
    subject(:play) { game.play }

    it 'updates the score' do
      expect(game.score).to receive(:update).exactly(10).times
      play
    end

    it 'runs each of the frames' do
      play
      expect(game.frames).to be_empty
    end

    it 'returns the final score' do
      expect(game.score).to receive(:final_score)
      play
    end
  end

  describe '#final_frame?' do
    subject(:final_frame?) { game.final_frame? }

    it { is_expected.to be false }

    context 'when running the last frame' do
      before do
        game.frames.clear
      end

      it { is_expected.to be true }
    end
  end
end

