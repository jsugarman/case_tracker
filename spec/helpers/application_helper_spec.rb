require 'spec_helper'

describe ApplicationHelper do

  describe "full_title" do
    it "should include the page title" do
      expect(full_title("foo")).to match(/foo/)
    end

    it "should include the base title" do
      expect(full_title("foo")).to match(/^Case Tracker/)
    end

    it "should include a bar if there is a page title" do
      expect(full_title("anything")).to match(/\|/)
    end

    it "should NOT include a bar if there is NO page title" do
      expect(full_title("")).not_to match(/\|/)
    end


  end

end