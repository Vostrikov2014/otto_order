require 'rails_helper'

RSpec.describe Order, type: :model do
  it { should have_one :client }
  it { should have_and_belong_to_many :products }

  #it { should validate_presence_of :client_id }

  it { should accept_nested_attributes_for :client }
end
