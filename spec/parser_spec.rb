require 'spec_helper'

include Twingly::Search

describe Parser do
  it { should respond_to(:parse) }

  describe "#parse" do
    subject { Parser.new.parse(document) }

    context "with a valid result" do
      let(:document) { Fixture.get(:valid) }

      it { is_expected.to be_a Result }
    end

    context "with a nonexistent api key result" do
      let(:document) { Fixture.get(:nonexistent_api_key) }

      it "should raise AuthError" do
        expect { subject }.to raise_error(AuthError)
      end
    end

    context "with a wrong api key result" do
      let(:document) { Fixture.get(:wrong_api_key) }

      it "should raise AuthError" do
        expect { subject }.to raise_error(AuthError)
      end
    end

    context "with a service unavailable result" do
      let(:document) { Fixture.get(:service_unavailable) }

      it "should raise ServerError" do
        expect { subject }.to raise_error(ServerError)
      end
    end

    context "with a undefined error result" do
      let(:document) { Fixture.get(:undefined_error) }

      it "should raise ServerError" do
        expect { subject }.to raise_error(ServerError)
      end
    end
  end
end
