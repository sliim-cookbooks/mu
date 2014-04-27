default["mu"]["build_dir"] = "/opt/mu"
default["mu"]["version"] = "0.9.8.5"
default["mu"]["emacs_package"] = "emacs23-nox"

case node['platform']
when 'debian'
  default["mu"]["packages"] = [ "libgmime-2.6-dev", "libxapian-dev", "guile-2.0-dev", "html2text", "xdg-utils", "guile-2.0-dev", "html2text", "xdg-utils", "g++", "libgtk2.0-dev" ]
end
