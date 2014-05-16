require 'spec/helpers/models_helper'

describe Foo do

  subject { Foo.new }

  context "initialization" do
    it "should create a foo instance" do
      refute_nil subject
    end
  end
end
