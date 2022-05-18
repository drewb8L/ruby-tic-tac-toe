# frozen_string_literal: true

require 'rspec'
require_relative '../src/rules'
require_relative '../src/board'
require_relative '../src/game'

# Moving rule logic away from game and board classes, they don't need to know implementation details of rules

describe Rules do
  it "should exist" do
    expect(subject).to exist # Yes rules SHOULD exist XD
  end
end
