require 'rails_helper'

describe Resume do
  let!(:css)  { create :skill, name: 'css' }
  let!(:js)   { create :skill, name: 'js' }
  let!(:html) { create :skill, name: 'html' }
  let!(:ruby) { create :skill, name: 'ruby' }

  context 'when resume has related vacancies' do
    let!(:empty_vacancy)        { create :vacancy, skills: [] }
    let!(:easy_vacancy)         { create :vacancy, skills: [css] }
    let!(:exact_vacancy)        { create :vacancy, skills: [css, js, html] }
    let!(:extra_skills_vacancy) { create :vacancy, skills: [css, js, html, ruby] }

    describe '#fully_vacancies' do
      subject { resume.fully_vacancies }

      context 'when resume has skills' do
        let(:resume) { create :resume, skills: [css, js, html] }

        it 'returns fully suitable vacancies' do
          should match_array [empty_vacancy, easy_vacancy, exact_vacancy]
        end
      end

      context 'when resume has no skills' do
        let(:resume) { create :resume, skills: [] }

        it 'returns only empty vacancies' do
          should match_array [empty_vacancy]
        end
      end
    end

    describe '#partly_vacancies' do
      subject { resume.partly_vacancies }

      context 'when resume has skills' do
        let(:resume) { create :resume, skills: [css, js, html] }

        it 'returns partly suitable vacancies' do
          should match_array [extra_skills_vacancy]
        end
      end
    end
  end
end
