require 'spec_helper'

module Seo
  describe CircularRedirect do
    let(:klass) do
      Class.new { include CircularRedirect }
    end

    context "redirects that point to each other" do
      let(:new_redirect) do
        ->(origin,dest) do
          PermanentRedirect.new(origin_id: origin, destination_id: dest)
        end
      end

      describe "directly circular" do
        before  { new_redirect.call(1,2).save! }
        subject { new_redirect.call(2,1).save }
        it { should be_false }
      end

      describe "chaining" do
        before do
          new_redirect.call(1,2).save!
          new_redirect.call(2,3).save!
        end

        context "with an endpoint" do
          subject { new_redirect.call(3,4).save }
          it { should be_true }
        end

        context "the end back to the beginning" do
          subject { new_redirect.call(3,1).save }
          it { should be_false }
        end
      end
    end
  end
end
