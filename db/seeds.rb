html_skill = Skill.find_or_create_by(name: 'html')
css_skill = Skill.find_or_create_by(name: 'css')
js_skill = Skill.find_or_create_by(name: 'js')

vacancy = Vacancy.find_or_create_by(name: 'Верстальщик',
                                    expires_at: Time.current + 1.day,
                                    phone: '22-22-22',
                                    email: 'mail@example.com',
                                    extra_contacts: 'Moscow')

resume = Resume.find_or_create_by(first_name: 'Игорь',
                                  last_name: 'Петров',
                                  middle_name: 'Александрович',
                                  phone: '11-11-11',
                                  email: 'igor@example.com',
                                  desired_salary: 80_000,
                                  is_active: true)

SkillHolding.find_or_create_by(skillable: vacancy, skill: html_skill)
SkillHolding.find_or_create_by(skillable: vacancy, skill: css_skill)
SkillHolding.find_or_create_by(skillable: vacancy, skill: js_skill)

SkillHolding.find_or_create_by(skillable: resume, skill: html_skill)
SkillHolding.find_or_create_by(skillable: resume, skill: css_skill)
SkillHolding.find_or_create_by(skillable: resume, skill: js_skill)
