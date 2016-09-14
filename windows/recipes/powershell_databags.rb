Chef::Log.info("******Testing powershell and environment variables ******")

powershell_script "Get some data from databags n stuff" do
 guard_interpreter :powershell_script
 code <<-EOC
 	echo "====== TESTING STUFF ======"
	echo '{#node['myvar']}' >> c:/temp.txt
 EOC
end
