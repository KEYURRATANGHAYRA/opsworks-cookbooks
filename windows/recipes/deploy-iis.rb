app = search("aws_opsworks_app","deploy:true").first  
app_dir = "c:\inetpub\wwwroot\#{app[:shortname]}"  

application app_dir do
	git app_dir do
		repository app["app_source"]["url"]
		revision app["app_source"]["revision"]
	end
	
end