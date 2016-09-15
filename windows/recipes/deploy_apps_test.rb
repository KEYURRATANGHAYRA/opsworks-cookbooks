Chef::Log.info "About to search apps"

# Search apps to be deployed. Without deploy:true filter all apps would be returned.
apps = search(:aws_opsworks_app, "deploy:true") rescue []
Chef::Log.info "Found #{apps.size} apps to deploy on the stack. Assuming they are all Node.JS apps."

apps.each do |app|
	Chef::Log.info "Deploying #{app["shortname"]}."
	Chef::Log.info "Deploying #{app["app_source"]}."
	Chef::Log.info "Deploying #{app["environment"]["myenvvar"]}."
end
