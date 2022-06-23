main:
	zip data.zip -ru data || [ $$? -eq 12 ]
	zip jackets.zip -ru jackets || [ $$? -eq 12 ]
	zip simfiles.zip -ru simfiles || [ $$? -eq 12 ]
