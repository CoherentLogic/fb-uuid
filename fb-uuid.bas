#lang "fb"
#define CRYPTO_RNG 5

declare function uuidv4() as string
declare function rand_range(first as double, last as double) as integer

function rand_range(first as double, last as double) as integer
	return int(rnd * (last - first) + first)
end function

function uuidv4() as string

	dim chars as string
	dim uuid as string
	dim i as integer
	
	randomize timer, CRYPTO_RNG
	
	chars = "0123456789abcdef"

	for i = 1 to 30
		uuid = uuid + mid(chars, rand_range(1, len(chars)), 1)
	next i
	
		
	return mid(uuid, 1, 8) + "-" + mid(uuid, 9, 4) + "-4" + mid(uuid, 13, 3) + "-" + mid("89ab", rand_range(1, 4), 1) + mid(uuid, 16, 3) + "-" + mid(uuid, 19, 11)
	
end function

print uuidv4()
