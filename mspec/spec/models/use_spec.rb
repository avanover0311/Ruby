require 'rails_helper'

RSpec.describe Use, type: :model do
	context "with valid attributes" do
  		it "should not save if first_name field is blank" do
  			user = Use.new(
  				first_name: 'shane',
  				last_name: 'chang',
  				email: 'schang@codingdojo'
  			)
  	expect(user).to be_valid
  end
 end

 context "with invalid attributes" do
 	it "should not save if first_name is blank" do
 		user = Use.new(
 			first_name: '',
 			last_name: 'chang',
 			email: 'schang@codingdojo.com')
 	expect(user).to be_invalid
 end 
 context "with invalid attributes" do
  	it 'should not save if last_name field is blank'
  		user = Use.new(
 			first_name: '',
 			last_name: 'chang',
 			email: 'schang@codingdojo.com')
 	expect(user).to be_invalid
 end 
 context "with invalid attributes" do
  	it "should not save if email already exists"
  		it 'should not save if last_name field is blank'
  		user = Use.new(
 			first_name: '',
 			last_name: 'chang',
 			email: 'schang@codingdojo.com')
 	expect(user).to be_invalid
 end
 context "with invalid attributes" do
  	it "should not save if invalid email format"
 end
end
