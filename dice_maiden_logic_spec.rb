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
  context 'given 3wh4+' do
    it 'returns a Warhammer Age of Sigmar/40k style roll' do
      expect(alias_input_pass('3wh4+')).to eq('3d6 t4')
    end
  end
  context 'given dd34' do
    it 'returns a Double digit roll' do
      expect(alias_input_pass('dd34')).to eq('(1d3 * 10) + 1d4')
    end
  end
  context 'given age' do
    it 'returns an AGE system roll' do
      expect(alias_input_pass('age')).to eq('2d6 + 1d6')
    end
  end
  context 'given +dX' do
    it 'returns an advantage roll where X is the dice sides value' do
      expect(alias_input_pass('+d20')).to eq('2d20 d1')
    end
  end
  context 'given -dX' do
    it 'returns a disadvantage roll where X the dice sides value' do
      expect(alias_input_pass('-d20')).to eq('2d20 kl1')
    end
  end
  context 'given +d%' do
    it 'returns an advantage roll for a percentile dice in a roll-under system' do
      expect(alias_input_pass('+d%')).to eq('((2d10kl1-1) *10) + 1d10')
    end
  end
  context 'given -d%' do
    it 'returns a disadvantage roll for a percentile dice in a roll-under system' do
      expect(alias_input_pass('-d%')).to eq('((2d10k1-1) *10) + 1d10')
    end
  end
end
