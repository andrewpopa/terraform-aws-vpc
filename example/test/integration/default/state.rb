require 'awspec'

describe vpc('my-aws-vpc') do
  it { should exist }
  it { should have_tag('Name').value('my-aws-vpc') }
end