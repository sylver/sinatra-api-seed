require_relative '../helpers/models_helper'

describe Foo do

  subject { Foo.new }

  context "initialization" do
    it "should create a foo instance" do
      p subject
      refute_nil subject
    end
  end
end
