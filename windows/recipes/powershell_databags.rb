Chef::Log.info("******Testing powershell and environment variables ******")

powershell_script "Get some data from databags n stuff" do
 guard_interpreter :powershell_script
 code <<-EOH
	$myvariable = '#{node['myvar']}'
	echo $myvariable >> c:\tmp1.txt
 EOH
end
