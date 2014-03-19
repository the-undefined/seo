require 'spec_helper'

module Seo
  describe InfiniteRedirect do
    let(:klass) do
      Class.new do
        include InfiniteRedirect
      end.new
    end

    subject { klass.valid_redirect?(origin, destination) }

    context "different origin and destination" do
      let(:origin)      { 1 }
      let(:destination) { 2 }

      it { should be_true }
    end

    context "with the same origin and destination" do
      let(:origin)      { 1      }
      let(:destination) { origin }

      it { should be_false }
    end
  end
end
