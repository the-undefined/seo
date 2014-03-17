require 'spec_helper'

module Seo
  describe PermanentRedirect do
    context "origin and destination" do
      it "should be different" do
        expect( PermanentRedirect.new(origin_id: 1, destination_id: 1).save ).to be_false
        expect( PermanentRedirect.new(origin_id: 1, destination_id: 2).save ).to be_true
      end

      describe "unique pairings" do
        let(:redirect_attrs) { { origin_id: 1, destination_id: 2 } }
        before { PermanentRedirect.create!(redirect_attrs) }
        specify "cannot create a duplicate redirect" do
          expect(PermanentRedirect.new(redirect_attrs).save).to be_false
        end
      end

      describe "cannot be circular" do
        specify "refuses to create infinite redirect" do
          PermanentRedirect.create(origin_id: 1, destination_id: 2)
          expect(PermanentRedirect.new(origin_id: 2, destination_id: 1).save).to be_false
        end
      end
    end
  end
end
