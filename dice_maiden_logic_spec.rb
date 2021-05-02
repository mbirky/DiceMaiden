# frozen_string_literal: true

require_relative 'dice_maiden_logic'

describe 'alias_input_pass' do
  context 'given a non-aliased command' do
    it 'returns the command' do
      expect(alias_input_pass('1d8')).to eq('1d8')
    end
  end
  context 'given 4cod' do
    it 'returns a Chronicles of Darkness roll' do
      expect(alias_input_pass('4cod')).to eq('4d10 t8 ie10')
    end
  end
  context 'given 4wod8' do
    it 'returns a World of darkness 4th edition roll' do
      expect(alias_input_pass('4wod8')).to eq('4d10 f1 ie10 t8')
    end
  end
  context 'given 3df' do
    it 'returns a Fudge dice from the fate RPG system' do
      expect(alias_input_pass('3df')).to eq('3d3 t3 f1')
    end
  end
end
