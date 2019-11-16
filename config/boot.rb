ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../Gemfile', __dir__)

require 'bundler/setup' # Set up gems listed in the Gemfile.
(require 'nidone'; Nidone.setup(cache_path: 'tmp/.nidone')) unless ENV.has_key?("ENABLE_BOOTSNAP")

require 'bootsnap'

env = ENV['RAILS_ENV'] || ENV['RACK_ENV'] || ENV['ENV']
development_mode = ['', nil, 'development'].include?(env)
cache_dir = ENV['BOOTSNAP_CACHE_DIR']
iseq_cache_enabled = ENV.has_key?("ENABLE_BOOTSNAP")

Bootsnap.setup(
  cache_dir:            cache_dir,
  development_mode:     development_mode,
  load_path_cache:      true,
  autoload_paths_cache: true, # assume rails. open to PRs to impl. detection
  disable_trace:        false,
  compile_cache_iseq:   iseq_cache_enabled,
  compile_cache_yaml:   true,
)
