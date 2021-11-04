User.create([{
  name: '管理者ユーザー',
  email: 'admin@email.co.jp',
  password: 'adminpass',
  password_confirmation: 'adminpass',
  age: '30代',
  organization: '地方公務員',
  job: '事務系',
  status: '現職',
  active: true,
  admin: true},
{
  name: 'ゲストユーザー',
  email: 'guest@email.co.jp',
  password: 'guestpass',
  password_confirmation: 'guestpass',
  age: '20代',
  organization: '国家公務員',
  job: '事務系',
  status: '現職',
  introduction: 'ユーザー登録せずに利用できるゲストユーザーです。',
  active: true,
  admin: false
}])
