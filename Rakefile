require 'html/proofer'

task :default => [:test]

task :test do
  sh "bundle exec jekyll build"
  HTML::Proofer.new("./_site",
    :parallel => { :in_threads => 4 },
  ).run
end
