User.create([{
  name: '管理者ユーザー',
  email: 'admin@email',
  password: 'admin',
  password_confirmation: 'admin',
  age: '30代',
  organization: '地方公務員',
  job: '事務系',
  status: '現職',
  active: true,
  admin: true},
{
  name: 'ゲストユーザー',
  email: 'guest@email',
  password: 'guest',
  password_confirmation: 'guest',
  age: '20代',
  organization: '国家公務員',
  job: '事務系',
  status: '現職',
  active: true,
  admin: false
}])
