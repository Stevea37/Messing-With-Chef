# Add a test file

file 'C:/testfile.txt' do
  content 'content'
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end
