main: hash
	zip data.zip -ru data || [ $$? -eq 12 ]
	zip jackets.zip -ru jackets || [ $$? -eq 12 ]
	zip simfiles.zip -ru simfiles || [ $$? -eq 12 ]

hash: 
	bash ./bin/hashSongs.sh > hashes/songs.txt
	bash ./bin/hashJackets.sh > hashes/jackets.txt
	bash ./bin/hash.sh courses.json > hashes/courses.txt