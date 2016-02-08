namespace :viewer do
  desc 'NPM install'
  task :npm_install do
    on roles(:app) do
      within "#{release_path}/viewer" do
        execute "cd #{release_path}/viewer && npm install"
      end
    end
  end

  desc 'NPM install'
  task :build  do
    on roles(:app) do
      within "#{release_path}/viewer" do
        execute "cd #{release_path}/viewer"
        execute "cd #{release_path}/viewer && npm run tsc"
      end
    end
  end

  before 'viewer:build', 'viewer:npm_install'
end
