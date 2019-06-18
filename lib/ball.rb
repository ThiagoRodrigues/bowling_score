# frozen_string_literal: true

class Ball
  attr_reader :context

  def initialize(context)
    @context = context
  end

  def self.roll(context)
    new(context).roll
  end

  def roll
    context.score << knocked_pins
    context.pins -= knocked_pins
  end

  private

  def knocked_pins
    @knocked_pins ||= rand(pins + 1)
  end

  def pins
    @pins ||= context.pins
  end
end
