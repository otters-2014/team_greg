namespace :db do
  task :dev_only do
    raise "You can only use this in dev!" unless Rails.env == 'development'
  end

  desc "drop,create,migrate,seed,prepare"
  task nuke: [
    'environment',
    'db:dev_only',
    'db:drop',
    'db:create',
    'db:migrate',
    'db:seed',
    'db:test:prepare'
  ]
end
