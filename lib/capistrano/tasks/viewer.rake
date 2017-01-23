namespace :'viewer-ag' do
  desc 'NPM install'
  task :npm_install do
    on roles(:app) do
      within "#{release_path}/viewer-ag" do
        execute "cd #{release_path}/viewer-ag && npm install"
      end
    end
  end

  desc 'NPM install'
  task :build  do
    on roles(:app) do
      within "#{release_path}/viewer-ag" do
        execute "cd #{release_path}/viewer-ag"
        execute "cd #{release_path}/viewer-ag && npm run tsc"
      end
    end
  end

  before 'viewer-ag:build', 'viewer-ag:npm_install'
end
