# frozen_string_literal: true

require 'spec_helper'
require 'frame'
require 'extra_ball'

RSpec.describe ExtraBall do
  subject(:roll) { described_class.roll(frame) }

  let(:frame) { Frame.new(game) }
  let(:game) { Game.new }

  describe '.roll' do
    it { is_expected.to be_a Integer }

    it 'returns within a range of (0..10)' do
      expect((0..10)).to include(roll)
    end
  end
end
