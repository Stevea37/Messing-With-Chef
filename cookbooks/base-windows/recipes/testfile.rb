# Add a test file

file 'C:/users/DomainAdmin/Desktop/testfile.txt' do
  content 'content'
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end
