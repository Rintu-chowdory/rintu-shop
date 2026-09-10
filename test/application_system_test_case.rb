require "test_helper"

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  driven_by :selenium, using: :headless_chrome, screen_size: [ 1400, 1400 ] do |options|
    if Process.uid.zero? # root inside a container (local sandbox); GitHub Actions runners are non-root
      options.add_argument("--no-sandbox")
      options.add_argument("--disable-dev-shm-usage")
    end
  end
end
