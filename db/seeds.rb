html = Skill.find_or_create_by(name: 'html')
css = Skill.find_or_create_by(name: 'css')
js = Skill.find_or_create_by(name: 'js')
ruby = Skill.find_or_create_by(name: 'ruby')

vacancy = Vacancy.find_or_create_by(name: 'Верстальщик',
                                    salary: 80_000,
                                    phone: '22-22-20',
                                    email: 'mail@example.com',
                                    extra_contacts: 'Moscow')
vacancy.update_attribute(:expires_at, Time.current + 1.day)

vacancy1 = Vacancy.find_or_create_by(name: 'Верстальщик 1',
                                     salary: 70_000,
                                     phone: '22-22-21',
                                     email: 'mail@example.com',
                                     extra_contacts: 'Moscow')
vacancy1.update_attribute(:expires_at, Time.current + 1.day)

vacancy2 = Vacancy.find_or_create_by(name: 'Верстальщик 2',
                                     salary: 90_000,
                                     phone: '22-22-22',
                                     email: 'mail@example.com',
                                     extra_contacts: 'Moscow')
vacancy2.update_attribute(:expires_at, Time.current + 1.day)

resume = Resume.find_or_create_by(first_name: 'Игорь',
                                  last_name: 'Петров',
                                  middle_name: 'Александрович',
                                  phone: '11-11-11',
                                  email: 'igor@example.com',
                                  desired_salary: 80_000,
                                  is_active: true)

resume2 = Resume.find_or_create_by(first_name: 'Владимир',
                                   last_name: 'Иванов',
                                   middle_name: 'Константинович',
                                   phone: '11-11-11',
                                   email: 'igor@example.com',
                                   desired_salary: 50_000,
                                   is_active: true)

add_skills = proc do |skillable, *skills|
  skills.each do |skill|
    SkillHolding.find_or_create_by(skillable: skillable, skill: skill)
  end
end

add_skills.call(vacancy, html, css, js)
add_skills.call(vacancy1, html, css)
add_skills.call(vacancy2, html, css, js, ruby)
add_skills.call(resume, html, css, js)
add_skills.call(resume2, html, css)
