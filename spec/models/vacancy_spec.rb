require 'rails_helper'

describe Vacancy do
  let!(:css)  { create :skill, name: 'css' }
  let!(:js)   { create :skill, name: 'js' }
  let!(:html) { create :skill, name: 'html' }
  let!(:ruby) { create :skill, name: 'ruby' }

  context 'when has related resumes' do
    let!(:empty_resume)  { create :resume, skills: [] }
    let!(:weak_resume)   { create :resume, skills: [css, js] }
    let!(:exact_resume)  { create :resume, skills: [css, js, html] }
    let!(:strong_resume) { create :resume, skills: [css, js, html, ruby] }

    describe '#fully_resumes' do
      subject { vacancy.fully_resumes }

      context 'when vacancy has skills' do
        let(:vacancy) { create :vacancy, skills: [css, js, html] }

        it 'returns fully suitable resumes' do
          should match_array [exact_resume, strong_resume]
        end
      end

      context 'when vacancy has no skills' do
        let(:vacancy) { create :vacancy, skills: [] }

        it 'returns all resumes' do
          should match_array [empty_resume, exact_resume, weak_resume, strong_resume]
        end
      end
    end

    describe '#partly_resumes' do
      subject { vacancy.partly_resumes }

      context 'when vacancy has skills' do
        let(:vacancy) { create :vacancy, skills: [css, js, html] }

        it 'returns partly suitable resumes' do
          should match_array [weak_resume]
        end
      end

      context 'when vacancy has no skills' do
        let(:vacancy) { create :vacancy, skills: [] }

        it 'returns empty list' do
          should be_empty
        end
      end
    end
  end
end
