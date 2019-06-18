# frozen_string_literal: true

require 'spec_helper'
require 'score'

RSpec.describe Score do
  let(:score) { described_class.new }

  let(:frame_one) do
    instance_double(
      'Frame',
      score: [1, 1],
      strike?: false,
      spare?: false
    )
  end

  let(:frame_two) do
    instance_double(
      'Frame',
      score: [3, 6],
      strike?: false,
      spare?: false
    )
  end

  let(:strike_frame) do
    instance_double(
      'Frame',
      score: [10],
      strike?: true,
      spare?: false,
      bonus: true
    )
  end

  let(:spare_frame) do
    instance_double(
      'Frame',
      score: [4, 6],
      strike?: false,
      spare?: true,
      bonus: true
    )
  end

  describe '#update' do
    it 'updates a new frame to the score' do
      expect { score.update(frame_one) }.to change(score, :frames)
    end

    context 'updating another frame' do
      before do
        score.update(frame_one)
      end

      it 'updates a new frame to score but do nothing more' do
        score.update(frame_two)

        expect(score.send(:frames)).to eql([frame_one, frame_two])
      end
    end

    context 'updating after a strike' do
      before do
        score.update(strike_frame)
      end

      it 'updates a frame and set the bonus to the previous frame' do
        expect(strike_frame).to receive(:bonus).with(frame_one.score)

        score.update(frame_one)
      end
    end

    context 'updating after a spare' do
      before do
        score.update(spare_frame)
      end

      it 'updates a frame and set the bonus to the previous spare frame' do
        expect(spare_frame).to receive(:bonus).with(frame_one.score.first)

        score.update(frame_one)
      end
    end
  end
end
