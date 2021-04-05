require 'rails_helper'

RSpec.describe Client, type: :model do
  it { should have_many :orders }
  it { should validate_presence_of :number }
  it { should validate_presence_of :name }
end
