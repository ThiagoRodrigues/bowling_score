# frozen_string_literal: true

class Game
  attr_reader :frames, :score

  def initialize
    @frames = Array.new(10) { Frame.new(self) }
    @score = Score.new
  end

  def self.autoplay
    new.play
  end

  def play
    while !final_frame? do
      update_score(frames.shift.play)
    end

    final_score
  end

  def final_frame?
    frames.empty?
  end

  private

  def update_score(frame)
    score.update(frame)
  end

  def final_score
    score.final_score
  end
end
