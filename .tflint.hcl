config {
  format = "compact"
  plugin_dir = "/root/.tflint.d/plugins"

  module = false
  force = false
  disabled_by_default = false
}

plugin "google" { enabled = true }

