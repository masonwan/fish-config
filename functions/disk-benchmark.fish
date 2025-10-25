function disk-benchmark -d 'Benchmark a give path for disk read/write speed'
	if test (count $argv) -ne 1
		echo "Usage: disk-benchmark <folder>" >&2
		return 1
	end
	set -l folder $argv[1]
	set -l file $folder/testfile
	log info "Writing file to $file..."

	# Time the write speed, bypassing the OS cache for a true disk write test.
	# Using a 1GiB file (1M block size * 1024 blocks).
	time dd if=/dev/zero of=$file bs=1M count=1024 status=progress oflag=direct

	log info "Reading file from $file..."
	# Time the read speed, bypassing the OS cache for a true disk read test.
	time dd if=$file of=/dev/null bs=1M status=progress iflag=direct

	log info "Deleting file at $file..."
	rm $file
end
