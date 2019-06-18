# frozen_string_literal: true

require 'spec_helper'
require 'frame'
require 'ball'

RSpec.describe Ball do
  subject(:roll) { described_class.roll(frame) }

  let(:frame) { Frame.new(game) }
  let(:game) { Game.new }

  describe '.roll' do
    it 'updates context score' do
      expect { roll }.to change(frame, :score)
    end

    it 'updates context pins' do
      expect { roll }.to change(frame, :pins)
    end
  end
end
