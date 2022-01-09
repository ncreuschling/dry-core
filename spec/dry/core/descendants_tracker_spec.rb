# frozen_string_literal: true

require "dry/core/descendants_tracker"

RSpec.describe Dry::Core::DescendantsTracker do
  before do
    module Test
      class Parent
        extend Dry::Core::DescendantsTracker
      end

      class Child < Parent
      end

      class Grandchild < Child
      end
    end
  end

  it "tracks descendants" do
    expect(Test::Parent.descendants).to eql([Test::Child, Test::Grandchild])
  end
end
