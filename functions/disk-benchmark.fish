function disk-benchmark -d 'Benchmark a give path for disk read/write speed'
	if test (count $argv) -ne 1
		echo "Usage: disk-benchmark <folder>" >&2
		return 1
	end
	set -l folder $argv[1]
	set -l file $folder/testfile
	log info "Writing file to $file..."

	# Time the write speed. Direct I/O and status flags are Linux/GNU-specific.
	set -l dd_flags
	if test (uname) = Linux
		set dd_flags status=progress oflag=direct
	end

	time dd if=/dev/zero of=$file bs=1M count=1024 $dd_flags

	log info "Reading file from $file..."
	set -l dd_read_flags
	if test (uname) = Linux
		set dd_read_flags status=progress iflag=direct
	end
	time dd if=$file of=/dev/null bs=1M $dd_read_flags

	log info "Deleting file at $file..."
	rm -f $file
end
