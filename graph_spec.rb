require './graph'

RSpec.describe Graph do
  before(:all) do
    file = "test.data"
    @graph = Graph.new(file)
  end
  describe "#New" do
    it "Creates Graph Object" do
      correct_response = Graph
      test_response = @graph.class
      expect(test_response).to eq(correct_response)
    end
  end

  describe "#Responses" do

    it "Gets ABC distance" do
      correct_response = 9
      test_response = @graph.routeABCdist
      expect(test_response).to eq(correct_response)
    end
    it "Gets AD distance" do
      correct_response = 5
      test_response =   @graph.routeADdist
      expect(test_response).to eq(correct_response)
    end
    it "Gets ADC distance" do
      correct_response = 13
      test_response =   @graph.routeADCdist
      expect(test_response).to eq(correct_response)
    end
    it "Gets AEBCD distance" do
      correct_response = 22
      test_response =   @graph.routeAEBCDdist
      expect(test_response).to eq(correct_response)
    end
    it "Gets AED distance" do
      correct_response = "NO SUCH ROUTE"
      test_response =   @graph.routeAEDdist
      expect(test_response).to eq(correct_response)
    end
    it "Gets number of CC routes max 3 stops" do
      correct_response = 2
      test_response =   @graph.routeCC
      expect(test_response).to eq(correct_response)
    end
    it "Gets A to C max 4 stops " do
      correct_response = 3
      test_response =     @graph.routeAC4
      expect(test_response).to eq(correct_response)
    end
    it "Gets shortest route distance between A to C" do
      correct_response = 9
      test_response =     @graph.routeACshort
      expect(test_response).to eq(correct_response)
    end
    it "Gets shortest route distance between B to B" do
      correct_response = 9
      test_response = @graph.routeBBshort
      expect(test_response).to eq(correct_response)
    end
    it "Gets number of routes between C to C less than 30" do
      correct_response = 7
      test_response = @graph.routeCC30
      expect(test_response).to eq(correct_response)
    end

  end

end
