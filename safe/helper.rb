require "codeclimate-test-reporter"
CodeClimate::TestReporter.start

require "minitest/autorun"
require "pry"

require "suture"

require "fileutils"
class SafeTest < Minitest::Test
  def setup
    super
    clean("db")
    ENV.delete_if { |(k,v)| k.start_with?("SUTURE_") }
    Suture.reset!
    Suture.config(:log_level => "DEBUG", :log_stdout => false, :log_file => "log/safe.log")
  end

private

  def clean(p)
    FileUtils.rm_rf(path(p))
  rescue Errno::ENOENT
  end

  def path(p)
    File.join(Dir.getwd, p)
  end
end

