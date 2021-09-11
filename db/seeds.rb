Age.create([{category: '10代'},{category: '20代'},{category: '30代'},{category: '40代'},{category: '50代以上'}])
Organization.create([{category: '国家公務員'},{category: '地方公務員'}])
Job.create([{category: '事務系'},{category: '技術系'}])
Status.create([{category: '現職'},{category: '退職済'}])

User.create([{
  name: '管理者ユーザー',
  email: 'admin@email',
  password: 'admin',
  password_confirmation: 'admin',
  age_id: 3,
  organization_id: 2,
  job_id: 1,
  status_id: 1,
  admin: true},
{
  name: 'ゲストユーザー',
  email: 'guest@email',
  password: 'guest',
  password_confirmation: 'guest',
  age_id: 2,
  organization_id: 1,
  job_id: 1,
  status_id: 2,
  admin: false
}])
