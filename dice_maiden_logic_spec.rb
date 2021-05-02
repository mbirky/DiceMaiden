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
  context 'given xd%' do
    it 'returns a simple shorthand for a d100 roll where x is the number of dice to roll' do
      expect(alias_input_pass('5d%')).to eq('5d100')
    end
  end
  context 'given snm5' do
    it 'returns a Sunsails: New Millennium 4th edition roll' do
      expect(alias_input_pass('snm5')).to eq('5d6 ie6 t4')
    end
  end
  context 'given d6s4' do
    it 'returns a D6 System roll' do
      expect(alias_input_pass('d6s4')).to eq('4d6 + 1d6 ie')
    end
  end
  context 'gien sr6' do
    it 'returns a Shadowrun system roll' do
      expect(alias_input_pass('sr6')).to eq('6d6 t5')
    end
  end
  context 'given sp4' do
    it 'returns a Storypath system roll' do
      expect(alias_input_pass('sp4')).to eq('ul 4d10 t8 ie10')
    end
  end
  context 'given 6yz' do
    it 'return a Year Zero system roll' do
      expect(alias_input_pass('6yz')).to eq('6d6 t6')
    end
  end
end
