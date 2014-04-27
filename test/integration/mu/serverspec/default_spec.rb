require "spec_helper"

describe file("/opt/mu") do
  it { should be_directory }
end

describe file("/opt/mu/README") do
  it { should be_file }
end

describe file("/usr/local/bin/mu") do
  it { should be_file }
end
