#  frozen_string_literal: true

class Score
  def initialize
    @frames = []
  end

  def update(frame)
    if strike_sequence?
      last_frame.bonus(frame.score)
    end

    if spare_sequence?
      last_frame.bonus(frame.score.first)
    end

    frames << frame
  end

  def final_score
    puts '*' * 100
    puts "Total Points: #{total}"
    puts '*' * 100
    puts "Number of Strikes: #{strikes}"
    puts '*' * 100
    puts "Number of Spares: #{spares}"
    puts '*' * 100
    puts "Pints per frame: #{frames.map(&:score)}"
    puts '*' * 100
  end

  private

  attr_reader :frames, :last_frame

  def total
    frames.map(&:score).flatten.sum
  end

  def strikes
    frames.map {|t| t if t.strike? }.compact.size
  end

  def spares
    frames.map {|t| t if t.spare? }.compact.size
  end

  def strike_sequence?
    last_frame&.strike?
  end

  def spare_sequence?
    last_frame&.spare?
  end

  def last_frame
    frames.last
  end
end
