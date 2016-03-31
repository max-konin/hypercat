namespace :ember do
  desc 'cp ember assets'
  task :copy_assets do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      execute "cd #{release_path} && rm -rf public/assets/ember && mkdir public/assets/ember"
      execute "cd #{release_path} && cp tmp/ember-cli/apps/viewer/assets public/assets/ember/ -r"
    end
  end

  task :compile do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      within release_path do
        with rails_env: "#{fetch(:stage)}" do
          execute :rake, 'ember:compile'
        end
      end
    end
  end
end
