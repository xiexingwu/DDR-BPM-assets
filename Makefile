main: hash
	zip data.zip -qr data || [ $$? -eq 12 ]
	zip jackets.zip -qr jackets || [ $$? -eq 12 ]
	zip simfiles.zip -qr simfiles || [ $$? -eq 12 ]

hash: 
	mkdir hashes || [ $$? -eq 1 ]
	bash ./bin/hashSongs.sh > hashes/songs.txt
	bash ./bin/hashJackets.sh > hashes/jackets.txt
	bash ./bin/hash.sh courses.json > hashes/courses.txt