require 'rails_helper'

describe Skill do
  it 'impossible to create empty skill' do
    expect { create(:skill, name: '  ') }.to raise_error ActiveRecord::RecordInvalid
  end

  context 'when one skill' do
    let!(:skill) { create :skill, name: 'skill' }

    it 'impossible to create skill with same name' do
      expect { create(:skill, name: 'skill').errors }.to raise_error ActiveRecord::RecordInvalid
    end
  end
end
