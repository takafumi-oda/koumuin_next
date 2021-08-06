Age.create([{age: '10代'},{age: '20代'},{age: '30代'},{age: '40代'},{age: '50代以上'}])
Organization.create([{organization: '国家公務員'},{organization: '地方公務員'}])
Job.create([{job: '事務系'},{job: '技術系'}])

User.create(
  name: '管理者ユーザー',
  email: 'admin@email',
  password: 'pass',
  password_confirmation: 'pass',
  age_id: 3,
  organization_id: 2,
  job_id: 1,
  admin: true
)
