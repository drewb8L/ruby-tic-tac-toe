# frozen_string_literal: true

require 'rspec'
require_relative '../src/cpu_player'
describe CpuPlayer do
  subject { described_class.new({ position: 'p2', mark: 'O ' }) }
  it 'Is a Player' do
    expect(subject.is_a?(Player)).to be_truthy
  end
end
