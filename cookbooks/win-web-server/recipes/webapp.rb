#
# Cookbook Name:: win-web-server
# Recipe:: webapp
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

# Enable IIS
dsc_script 'iis core' do
  code <<-EOH
  WindowsFeature InstallIISCore {
      Name = "Web-Server"
      Ensure = "Present"
  }
  EOH
end

dsc_script 'ASP NET 45' do
  code <<-EOH
  WindowsFeature InstallASP45 {
      Name = "Web-Asp-Net45"
      Ensure = "Present"
  }
  EOH
end

dsc_script 'iis mgmt' do
  code <<-EOH
  WindowsFeature InstallIISMgmt {
      Name = "Web-Mgmt-Console"
      Ensure = "Present"
  }
  EOH
end
