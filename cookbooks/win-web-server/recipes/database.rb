#
# Cookbook Name:: win-web-server
# Recipe:: database
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

include_recipe 'sql_server::server'

# Run Create-database.sql - This will create a table called "Customers" within the master database, then add three entries (Steven, Sohpie & Dilan)

## Create a path for the sql file stored in the chef cache
create_database_script_path = win_friendly_path(File.join(Chef::Config[:file_cache_path], 'create-database.sql'))

## Copy sql file from cookbook to Chef cache
cookbook_file 'create_database_script_path' do
  source 'create-database.sql'
end

# Variable for SQL Server PowerShell Module
sqlps_module_path = ::File.join(ENV['programfile(x86)'], 'Microsoft SQL Server\110\Tools\PowerShell\Modules\SQLPS')

# Run the SQL file, but only if learnchef has not been created
powershell_script 'Initialize Database' do
  code <<-EOH
  Import-Module "#{sqlps_module_path}"
  Invoke-Sqlcmd -InputFile #{create_database_script_path}
  EOH
  guard_interpreter :powershell_script
  only_if <<-EOH
  Import-Module "#{sqlps_module_path}"
  (Invoke-Sqlcmd -Query "SELECT COUNT(*) AS Count FROM sys.databases WHERE name = 'learnchef'").Count -eq 0
  EOH
end
