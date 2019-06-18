# frozen_string_literal: true

class Frame
  attr_accessor :pins, :score
  attr_reader :context, :balls

  def initialize(context)
    @context = context
    @pins = 10
    @balls = Array.new(2, Ball)
    @score = []
  end

  def play
    while balls.any? do
      roll_next_ball
      break if strike?
      roll_extra_ball if bonus_round?
    end
    self
  end

  def strike?
    pins.zero? && balls.any?
  end

  def spare?
    pins.zero? && balls.empty?
  end

  def bonus(value)
    score << value
  end

  private

  def roll_next_ball
    balls.shift.roll(self)
  end

  def bonus_round?
    spare? && context.final_frame?
  end

  def roll_extra_ball
    score << ExtraBall.roll(self)
  end
end
