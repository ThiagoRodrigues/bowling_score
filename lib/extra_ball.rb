# frozen_string_literal: true

class ExtraBall < Ball
  def self.roll(context)
    new(context).knocked_pins
  end

  def knocked_pins
    rand(pins + 1)
  end
end
