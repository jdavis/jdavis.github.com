require 'html-proofer'

task :default => [:test]

task :test do
  sh "bundle exec jekyll build"
  HTMLProofer.check_directory("./_site",
    :parallel => { :in_threads => 4 },
    :href_ignore => [
      # My profile is only viewable if logged in
      'https://www.facebook.com/joshd',

      # Apparently it is broken when URLs have query strings?
      /https:\/\/news\.ycombinator\.com\/user.*/,
      /https:\/\/news\.ycombinator\.com\/item.*/,

      # My Amazon profile is broken?
      'https://www.amazon.com/gp/pdp/profile/AYOIM6S23UDAH',
    ]
  ).run
end
