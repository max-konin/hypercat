namespace :ember do
  desc 'cp ember assets'
  task :copy_assets do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      execute "cd #{release_path} && rm -rf public/assets/ember && mkdir public/assets/ember"
      execute "cd #{release_path} && cp tmp/ember-cli/apps/frontend/assets public/assets/ember/ -r"
    end
  end
end
