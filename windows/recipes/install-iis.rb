if node[:platform].include?('windows')
  powershell_script 'enable-iis' do
    code <<-EOH
    Install-WindowsFeature -name Web-Server -IncludeManagementTools
    EOH
  end
end
