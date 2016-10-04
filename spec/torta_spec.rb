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
    it "requires an integer time argument" do
      expect{torta.bake!("a")}.to raise_error(TypeError)
      #allow(torta).to receive(:bake!).with(instance_of(String)) #Lo fuerza a recibir 
      #allow(torta).to receive(:bake!).with(instance_of(Integer)).and_return(torta.class)
      #expect(torta).to receive(:bake!).with('2') #pasa si el método bake! recibe como argumento "2"
      #expect(torta).to respond_to(:bake!).with(2).argument #pasa si el método bake! recibe 2 argumentos
    end

    it "returns the torta object" do
      #torta.should_receive(:bake!).and_return(10)
      torta.bake!(1).should be_instance_of(torta.class)
      #allow(torta).to receive(:bake!).and_return(be_a(torta.class)) #allow lo fuerza
      #expect(torta.bake!(1)).to be_a(torta.class)
    end

    it "changes the status of the torta when given enough time" do
      expect { torta.bake!(10) }.to change(torta, :status)
    end
  end

  #Test 8,9,10,11,12,13
  describe "#status" do
    it "returns the torta's current status" do
      #allow(torta).to receive(:status).and_return('crudo')
      expect(torta.status).to eq("crudo")
    end

    context "when unbaked" do
      it "is `crudo`" do
        (torta.status).should eq("crudo")
        #equivalentes
        #expect(torta.status).to eq("crudo")
      end
    end

    context "when baked for less than 5 minutes" do
      it "is `crudo`" do
        torta.bake!(4)
        torta.status.should eq("crudo")
        
        #expect{ torta.bake!(4) }.to output('crudo').to_stdout
      end
    end

    context "when baked for at least 5 but less than 7 minutes" do
      it "is `casi listo`" do
        expect { torta.bake!(6)}.to change(torta, :status).to("casi listo")
      end
    end

    context "when baked for at least 7 but less or equal than 10 minutes" do
      it "is `listo`" do
        expect { torta.bake!(10)}.to change(torta, :status).to("listo")
      end
    end

    context "when baked for at least 11 minutes" do
      it "is `quemado`" do
        expect { torta.bake!(11)}.to change(torta, :status).to("quemado")
      end
    end
  end

  #Test 14
  describe "#bake_time" do
    it "returns bake time of the specified type" do
      #expect(torta).to receive(:bake_time).and_return(10) #no funcionó
      #torta.should_receive(:bake_time).with(no_args)
      expect(torta.bake_time).to eq(10)
    end
  end
end
