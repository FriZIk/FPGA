webtalk_init -webtalk_dir D:/FPGA/KUZNECHIK_TAKE2/KUZNECHIK_TAKE2.sim/sim_1/behav/xsim/xsim.dir/SIMULATION_1_behav/webtalk/
webtalk_register_client -client project
webtalk_add_data -client project -key date_generated -value "Mon Oct 12 00:40:55 2020" -context "software_version_and_target_device"
webtalk_add_data -client project -key product_version -value "XSIM v2020.1 (64-bit)" -context "software_version_and_target_device"
webtalk_add_data -client project -key build_version -value "2902540" -context "software_version_and_target_device"
webtalk_add_data -client project -key os_platform -value "WIN64" -context "software_version_and_target_device"
webtalk_add_data -client project -key registration_id -value "211938874_0_0_942" -context "software_version_and_target_device"
webtalk_add_data -client project -key tool_flow -value "xsim_vivado" -context "software_version_and_target_device"
webtalk_add_data -client project -key beta -value "FALSE" -context "software_version_and_target_device"
webtalk_add_data -client project -key route_design -value "FALSE" -context "software_version_and_target_device"
webtalk_add_data -client project -key target_family -value "not_applicable" -context "software_version_and_target_device"
webtalk_add_data -client project -key target_device -value "not_applicable" -context "software_version_and_target_device"
webtalk_add_data -client project -key target_package -value "not_applicable" -context "software_version_and_target_device"
webtalk_add_data -client project -key target_speed -value "not_applicable" -context "software_version_and_target_device"
webtalk_add_data -client project -key random_id -value "51d13a35-a0f2-4b8f-abf9-3944bd3a8006" -context "software_version_and_target_device"
webtalk_add_data -client project -key project_id -value "f7fb6e84aed147f99b4d9ab125458e53" -context "software_version_and_target_device"
webtalk_add_data -client project -key project_iteration -value "81" -context "software_version_and_target_device"
webtalk_add_data -client project -key os_name -value "Windows Server 2016 or Windows 10" -context "user_environment"
webtalk_add_data -client project -key os_release -value "major release  (build 9200)" -context "user_environment"
webtalk_add_data -client project -key cpu_name -value "Intel(R) Core(TM) i5-4200U CPU @ 1.60GHz" -context "user_environment"
webtalk_add_data -client project -key cpu_speed -value "2297 MHz" -context "user_environment"
webtalk_add_data -client project -key total_processors -value "1" -context "user_environment"
webtalk_add_data -client project -key system_ram -value "8.000 GB" -context "user_environment"
webtalk_register_client -client xsim
webtalk_add_data -client xsim -key runall -value "true" -context "xsim\\command_line_options"
webtalk_add_data -client xsim -key Command -value "xsim" -context "xsim\\command_line_options"
webtalk_add_data -client xsim -key trace_waveform -value "true" -context "xsim\\usage"
webtalk_add_data -client xsim -key runtime -value "30300 ns" -context "xsim\\usage"
webtalk_add_data -client xsim -key iteration -value "12" -context "xsim\\usage"
webtalk_add_data -client xsim -key Simulation_Time -value "8.87_sec" -context "xsim\\usage"
webtalk_add_data -client xsim -key Simulation_Memory -value "7072_KB" -context "xsim\\usage"
webtalk_transmit -clientid 868413908 -regid "211938874_0_0_942" -xml D:/FPGA/KUZNECHIK_TAKE2/KUZNECHIK_TAKE2.sim/sim_1/behav/xsim/xsim.dir/SIMULATION_1_behav/webtalk/usage_statistics_ext_xsim.xml -html D:/FPGA/KUZNECHIK_TAKE2/KUZNECHIK_TAKE2.sim/sim_1/behav/xsim/xsim.dir/SIMULATION_1_behav/webtalk/usage_statistics_ext_xsim.html -wdm D:/FPGA/KUZNECHIK_TAKE2/KUZNECHIK_TAKE2.sim/sim_1/behav/xsim/xsim.dir/SIMULATION_1_behav/webtalk/usage_statistics_ext_xsim.wdm -intro "<H3>XSIM Usage Report</H3><BR>"
webtalk_terminate
