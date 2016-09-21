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
  	app = query.search(:aws_opsworks_app, "deploy:true").first
  	# First log line
  	Chef::Log.info "Deploying #{app["shortname"]}."
  	s3region = app[0][:environment][:S3REGION]
    s3bucket = app[0][:environment][:BUCKET]
	s3folder = app[0][:environment][:FOLDER]
    s3filename = app[0][:environment][:FILENAME]
    pclocalpath = app[0][:environment][:LOCALPATH]

    Chef::Log.info "***** #{s3region} *****"
    Chef::Log.info "***** #{s3bucket} *****"
    Chef::Log.info "***** #{s3folder} *****"
    Chef::Log.info "***** #{s3filename} *****"
    Chef::Log.info "***** #{pclocalpath} *****"

  end
end
