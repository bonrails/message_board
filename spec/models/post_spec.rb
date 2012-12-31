require 'spec_helper'

describe Post do
  describe "validations" do
   context "when required fields title and message with min length" do
     it "should fail title & message with invalid length min 2,4" do
       post = Post.new(:title => "h",:message => 'h')
       post.should_not be_valid
     end
     it "should pass title & message with valid length min 2,4" do
       post = Post.new(:title => "hh",:message => 'hhhh')
       post.should be_valid
     end
   end
   context "when required fields title and message with max length" do
     it "should fail title & message with invalid length max 50,500" do
       post = Post.new(:title => "h"*51,:message => 'h'*5001)
       post.should_not be_valid
     end
     it "should pass title & message with valid length max 50,500" do
       post = Post.new(:title => "h"*49,:message => 'h'*499)
       post.should be_valid
     end
   end
 end
end
