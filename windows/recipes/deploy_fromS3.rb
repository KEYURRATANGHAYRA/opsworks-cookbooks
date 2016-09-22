# Install AWS SDK
chef_gem "aws-sdk" do
  compile_time false
  action :install
end

# Actual copy 
Chef::Log.info("******Copy file from S3******")
Chef::Log.level = :debug
ruby_block 'envvarblock' do
  block do
  	query = Chef::Search::Query.new
  	apps = query.search(:aws_opsworks_app, "deploy:true")
  	#app = search(:aws_opsworks_app, "deploy:true") rescue []
  	# First log line
  	#Chef::Log.info "Deploying #{app["shortname"]}."
  	apps.each do |app| 
	  	#s3region = app[:environment][:S3REGION]
	    #s3bucket = app[:environment][:BUCKET]
		#s3folder = app[:environment][:FOLDER]
	    #s3filename = app[:environment][:FILENAME]
	    #pclocalpath = app[:environment][:LOCALPATH]

	    #Chef::Log.info "***** #{s3region} *****"
	    #Chef::Log.info "***** #{s3bucket} *****"
	    #Chef::Log.info "***** #{s3folder} *****"
	    #Chef::Log.info "***** #{s3filename} *****"
	    #Chef::Log.info "***** #{pclocalpath} *****"

	    Chef::Log.info "***** #{app[:environment][:S3REGION]} *****"
	end
  end
end
