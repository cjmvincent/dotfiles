# Run a test when tmux starts (default: off)
set -g @speedtest_run_on_start 'off'

# Key binding (default: o)
set -g @speedtest_key 'o'

# Key binding to clear results (default: O)
set -g @speedtest_clear_key 'O'

# Key binding for detail popup (default: d)
set -g @speedtest_detail_key 'S'

# Output format (default shown)
set -g @speedtest_format '↓ #{download} ↑ #{upload} #{ping}'

# Icon shown while test is running (default: ⏳)
set -g @speedtest_icon_running '⏳'

# Icon shown when no result yet (default: —)
# Set to "" (empty string) to auto-hide the plugin when idle
set -g @speedtest_icon_idle '󰊚'

# Timeout in seconds for each test (default: 120)
set -g @speedtest_timeout '120'

# Minimum time between tests (default: 0, disabled)
# Supports same syntax as @speedtest_interval (e.g., 30s, 5m, 1h30m)
set -g @speedtest_min_interval '5m'

# Temporary backoff duration after provider rate-limit response (default: 10m)
# Use 0/off/disabled to disable automatic backoff
set -g @speedtest_rate_limit_backoff '10m'

# Enable color coding (default: off)
set -g @speedtest_colors 'on'

# Speed thresholds in Mbps (values >= good = green, >= bad and < good = yellow, < bad = red)
set -g @speedtest_threshold_good '100'
set -g @speedtest_threshold_bad '25'

# Ping thresholds in ms (values <= good = green, <= bad and > good = yellow, > bad = red)
set -g @speedtest_ping_threshold_good '30'
set -g @speedtest_ping_threshold_bad '100'

# Custom colors (default: green, yellow, red)
set -g @speedtest_color_good 'green'
set -g @speedtest_color_warn 'yellow'
set -g @speedtest_color_bad 'red'