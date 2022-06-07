# frozen_string_literal: true

require 'rspec'
require_relative '../src/ai'

describe Ai do
  let(:spaces) do
    { 0 => '00', 1 => '01', 2 => '02', 3 => '03', 4 => '04', 5 => '05', 6 => '06', 7 => '07', 8 => '08' }
  end
  it ' should be able to pick an available space' do
    expect(Ai.pick_space(spaces)).to be_between(0, 8)
    expect(Ai.pick_space(spaces)).to be_between(0, 8)
    expect(Ai.pick_space(spaces)).to be_between(0, 8)
    expect(Ai.pick_space(spaces)).to be_between(0, 8)
    expect(Ai.pick_space(spaces)).to be_between(0, 8)
    expect(Ai.pick_space(spaces)).to be_between(0, 8)
    expect(Ai.pick_space(spaces)).to be_between(0, 8)
    expect(Ai.pick_space(spaces)).to be_between(0, 8)
  end
end
