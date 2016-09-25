Vacancy.find_or_create_by(name: 'Верстальщик',
                          expires_at: Time.current + 1.day,
                          phone: '22-22-22',
                          email: 'mail@example.com',
                          extra_contacts: 'Moscow')

Resume.find_or_create_by(first_name: 'Игорь',
                         last_name: 'Петров',
                         middle_name: 'Александрович',
                         phone: '11-11-11',
                         email: 'igor@example.com',
                         desired_salary: 80_000,
                         is_active: true)
