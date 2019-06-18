# frozen_string_literal: true

require 'spec_helper'
require 'frame'
require 'ball'

RSpec.describe Frame do
  let(:frame) { described_class.new(game) }

  let(:game) { double('Game', final_frame?: final_frame) }
  let(:final_frame) { false }

  describe '#play' do
    subject(:play) { frame.play }

    it { is_expected.to eq(frame) }

    it 'changes frame\'s score amount' do
      expect { play }.to change(frame, :score)
    end

    it 'changes frame\'s pins amount' do
      expect { play }.to change(frame, :pins)
    end

    it 'changes frame\'s balls amount' do
      expect { play }.to change(frame, :balls)
    end

    context 'when in a strike ball' do
      before do
        allow(frame).to receive(:strike?) { true }
      end

      it 'breaks the loop' do
        expect(frame).to receive(:strike?).once

        play
      end
    end
  end

  describe '#bonus' do
    subject(:bonus) { frame.bonus(3) }

    it 'changes frame\'s score amount' do
      expect { bonus }.to change(frame, :score)
    end
  end

  describe '#strike?' do
    subject(:strike?) { frame.strike? }

    it { is_expected.to be false }

    context 'when the next ball hits a strike' do
      before do
        frame.balls.shift
        frame.pins = 0
      end

      it { is_expected.to be true }
    end
  end

  describe '#spare?' do
    subject(:spare?) { frame.spare? }

    it { is_expected.to be false }

    context 'when the next ball hits a strike' do
      before do
        frame.balls.clear
        frame.pins = 0
      end

      it { is_expected.to be true }
    end
  end
end
