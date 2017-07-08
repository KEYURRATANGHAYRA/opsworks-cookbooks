app = search("aws_opsworks_app","deploy:true").first  
app_dir = "c:\\inetpub\\wwwroot"  

# Remove files from inetpub
powershell_script 'clear_inetpub' do
	code <<-EOH 
	Remove-Item #app_dir\* -recurse
	EOH
end

git app_dir do
	repository app["app_source"]["url"]
	revision app["app_source"]["revision"]
end
