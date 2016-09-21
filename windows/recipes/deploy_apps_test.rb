Chef::Log.info "About to search apps"

# Search apps to be deployed. Without deploy:true filter all apps would be returned.
apps = search(:aws_opsworks_app, "deploy:true") rescue []
Chef::Log.info "Found #{apps.size} apps to deploy on the stack."

apps.each do |app|
	Chef::Log.info "SHORTNAME #{app["shortname"]}."
	Chef::Log.info "APP SOURCE #{app["app_source"]}."
	Chef::Log.info "ENV VARIABLE #{app["environment"]["myenvvar"]}."
	powershell_script "register #{app["shortname"]}" do
		code <<-EOC
			$shortName = '#{app['shortname']}'
			$envVar = '#{app['environment']['myenvvar']}'
			echo $shortName >> c:/shortname.txt
			echo $envVar >> c:/envvar.txt
		EOC
	end
end
