require 'fruitmachine'
require 'rules'

describe FruitMachine do
  subject(:fruitmachine) { FruitMachine.new bank, rules }
  let(:bank) { instance_spy ( "bank" )}
  let(:rules) {instance_spy "rules"}
  describe '#all_the_same_colour' do
    it 'returns true if all the slots are the same' do
      allow(fruitmachine.wheel).to receive(:sample).and_return(:blue)
      fruitmachine.spin_the_wheels
      expect(fruitmachine.all_the_same_colour fruitmachine.player_turn).to be true
    end
  end
  describe '#all_different_colours' do
    it 'returns true if all 4 colours are different' do
      allow(fruitmachine.wheel).to receive(:sample).and_return(:blue)
      fruitmachine.wheel_one_spin
      allow(fruitmachine.wheel).to receive(:sample).and_return(:green)
      fruitmachine.wheel_one_spin
      allow(fruitmachine.wheel).to receive(:sample).and_return(:red)
      fruitmachine.wheel_one_spin
      allow(fruitmachine.wheel).to receive(:sample).and_return(:yellow)
      fruitmachine.wheel_one_spin
      expect(fruitmachine.all_different_colours fruitmachine.player_turn).to be true
    end
  end
  describe "#two_or_more_adjacent" do
    it 'returns true if two or more adjacent slots are the same' do
      allow(fruitmachine.wheel).to receive(:sample).and_return(:blue)
      fruitmachine.wheel_one_spin
      allow(fruitmachine.wheel).to receive(:sample).and_return(:green)
      fruitmachine.wheel_one_spin
      allow(fruitmachine.wheel).to receive(:sample).and_return(:green)
      fruitmachine.wheel_one_spin
      allow(fruitmachine.wheel).to receive(:sample).and_return(:yellow)
      fruitmachine.wheel_one_spin
      expect(fruitmachine.two_or_more_adjacent_colours fruitmachine.player_turn).to be true
    end
  end
  describe "#insert_coin" do
    it "inserts a coin into the fruit machine" do
      fruitmachine.insert_coin
      expect(bank).to have_recieved(:play_game)
    end
  end
  describe "#spin_the_wheels" do
    it "spins the wheels on the fruity" do
      allow(fruitmachine.wheel).to receive(:sample).and_return(:blue)
      fruitmachine.spin_the_wheels
      expect(fruitmachine.player_turn).to eq [:blue, :blue, :blue, :blue]
    end
  end
  describe "#wheel_one_spin" do
    it "spins one wheel on the fruit machine" do
      allow(fruitmachine.wheel).to receive(:sample).and_return(:blue)
      fruitmachine.wheel_one_spin
      expect(fruitmachine.player_turn).to eq [:blue]
    end
  end
  describe "#result_of_spin" do
    it "determines the result of a spin on the fruitmachine" do
      p fruitmachine.result_of_spin
        expect(bank).to have_recieved(:hit_the_jackpot)
        expect(bank).to have_recieved(:payout_five_times)
        expect(bank).to have_recieved(:payout_half)
    end
  end
end
