require 'spec_helper'

['libgmime-2.6-dev', 'libxapian-dev', 'guile-2.0-dev', 'html2text', 'xdg-utils', 'guile-2.0-dev', 'html2text', 'xdg-utils'].each do | pkg |
  describe package pkg do
    it { should be_installed }
  end
end

describe file('/opt/mu') do
    it { should be_directory }
end

describe file('/opt/mu/' + 'README') do
    it { should be_file }
end
