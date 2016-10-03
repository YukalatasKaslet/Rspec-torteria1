require 'torta'

describe Torta do

  let(:type)  { "milanesa" }
  let(:torta) { Torta.new(type) }

  #Test1
  subject { torta }
  it { is_expected.to respond_to(:type) }

  #Test 2 y 3
  describe "#initialize" do
    context "with valid input" do
      it "creates a new Torta of the specified type" do
        expect(torta.type).to eq(type)
      end
    end

    context "with invalid input" do
      it "throws an argument error when not given a type argument" do
        expect { Torta.new }.to raise_error(ArgumentError)
      end
    end
  end

  #Test 4
  describe "#type" do
    it "returns the type of the torta" do
      #expect(torta).to respond_to(:type)#.with(0).argument
      expect(torta.type).to eq(type)
    end
  end

  #Test 5, 6, 7
  describe "#bake!" do
    it "requires an integer time argument"# do
      #expect(torta).to respond_to(:bake!).with(2).argument
    #end

    it "returns the torta object"# do 
      #expect(torta.bake!(1)).to eq(torta.class)
    #end

    it "changes the status of the torta when given enough time" do
      expect { torta.bake!(10) }.to change(torta, :status)
    end
  end

  #Test 8,9,10,11,12,13
  describe "#status" do
    it "returns the torta's current status"

    context "when unbaked" do
      it "is `crudo`"
    end

    context "when baked for less than 5 minutes" do
      it "is `crudo`"
    end

    context "when baked for at least 5 but less than 7 minutes" do
      it "is `casi listo`"
    end

    context "when baked for at least 7 but less or equal than 10 minutes" do
      it "is `listo`"
    end

    context "when baked for at least 11 minutes" do
      it "is `quemado`"
    end
  end

  #Test 14
  describe "#bake_time" do
    it "returns bake time of the specified type" do
      expect(torta.bake_time).to eq(10)
    end
  end
end
