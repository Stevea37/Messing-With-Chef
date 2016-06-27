#
# Cookbook Name:: win-web-server
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

include_recipe 'win-web-server::webapp'

include_recipe 'win-web-server::database'


