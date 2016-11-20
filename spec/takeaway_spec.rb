require 'takeaway'

describe Takeaway do

  let(:takeaway) { described_class.new(menu, order) }
  let(:klass1) { double(:klass1) }
  let(:klass2) { double(:klass2) }
  let(:menu) { double(:menu) }
  let(:order) { double(:order) }

  before do
    allow(menu).to receive(:new).and_return menu
    allow(order).to receive(:new).and_return order
    allow(menu).to receive(:menu_list).and_return ({"Spag_Bol" => 6.5, "Pizza" => 4, "Chips" => 2.75})
  end

  context 'Initialization' do

    it 'accepts a Menu object on initialization' do
      expect(takeaway.menu).to eq menu
    end

    it 'accepts an Order object on initialization' do
      expect(takeaway.order).to eq order
    end
    
  end

  context 'Check if valid item' do

      it 'indicates when an item is not in the menu' do
        expect(takeaway.in_menu?("Peas")).to eq false
      end

      it 'indicates when an item is on the menu' do
        expect(takeaway.in_menu?("Spag_Bol")).to eq true
      end

  end

  context 'Calculate Total' do

    it 'calculates total cost' do
      expect(takeaway.calculate_total([{:item=>"Pizza",:qty=>3},{:item=>"Spag_Bol",:qty=>3}])).to eq 31.50
    end

  end

  # context 'Validating Order' do
  #
  #   it 'returns "Not a valid item" if item is not in menu' do
  #
  #
  #   end
  #
  #   it 'raises an error when total provided does not match total calculated' do
  #   message = "Incorrect total"
  #
  #   end
  #
  # end

  # context 'Accepting Order' do
  #
  #   it 'sends a payment confirmation text message' do
  #     expect(takeaway.accept_order(20.93)).to eq "Thank you for your order: £20.93"
  #   end
  #
  # end


end
