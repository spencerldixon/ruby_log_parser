require 'spec_helper.rb'
require 'parser.rb'

RSpec.describe Parser do
  before do
    @filepath       = 'spec/files/test.log'
    @invalid_file   = 'spec/files/test.txt'
    @parser         = Parser.new(@filepath)
  end

  describe "#initialise" do
    context "with a valid .log file" do
      it "reads the file successfully and assigns it to @file" do
        parser = Parser.new(@filepath)

        expect(parser.file).to_not be_nil
      end
    end

    context "with an invalid file type" do
      it "raises an error an does not initialize the parser" do
        expect {
          Parser.new(@invalid_file)
        }.to raise_error(ArgumentError)
      end
    end
  end

  describe "#log" do
    it "returns a two dimensional array of [[page, ip_address]]" do
      array = [["home","bob"],["home","bob"],["home","alice"],["contact","alice"]]

      expect(@parser.log).to match(array)
    end
  end

  describe "#pages" do
    it "returns an array of unique urls" do
      expect(@parser.pages).to match(["home", "contact"])
    end
  end

  describe "#page_views" do
    it "returns a hash of pages and counts" do
      expect(@parser.page_views).to match({"home" => 3, "contact" => 1})
    end
  end

  describe "#unique_page_views" do
    it "returns a hash of pages and unique counts" do
      expect(@parser.unique_page_views).to match({"home" => 2, "contact" => 1})
    end
  end
end
