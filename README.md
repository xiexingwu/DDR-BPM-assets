# README
This repository stores the resources required by the DDR BPM app.

# Makefile targets

- `main`

    Makes `.zip` archives for release.

# Files
- `all_songs.txt`

    List of songs that should be playable on arcade. Song name tries to be consistent with [ZiV official simfiles](https://zenius-i-vanisher.com/v5.2/simfiles.php?category=simfiles). 

- `jackets/*.png`

    CD Jackets.

- `simfiles/*.{sm,ssc}` **UNUSED**

    Simfiles.

- `data/*.json`

    JSON data for a song. Should contain the following fields:
    
    - `name` - Consistent with ZiV song name
    - `title` - Consistent with Arcade display name
    - `titletranslit` - Pronunciation of song consistent with ZiV
    - `version` - DDR A3, DDR A20 etc.
    - `resources`
        - `simfile` - Path to simfile **UNUSED**
        - `jacket` - Path to jacket
    - `song_length` - `float` - Song length in seconds 
    - `per_chart` - `bool` - Indicating if different difficulty charts have different timing properties (e.g. Chaos Terror, ACE FOR ACES, OVERDRIVE)
    - `levels`
        - `single` / `double`
            - `beginner` / `easy` / `medium` / `hard` / `challenge` - `int` - level of chart
    - `chart` - Array of JSON objects, each describing a chart's timing data. Either has length 1, meaning all charts share the same data, or has length corresponding to the total number of singles/doubles charts (bSP, BSP, DSP, ESP, CSP, BDP, DDP, EDP, CDP).
        - `dominant_bpm` - `int` - BPM most of the song is in
        - `true_min` / `true_max` - `int` - The lowest/highest BPM the chart reaches, even if temporarily
        - `bpm_range` - `string` - "200" for a constant BPM. "100~200" for variable BPM, where the min and max ignore short slow downs or speed ups (think ANTI ANTHEM gimmicks and ENDYMION 880 speedup)
        - `bpms` - Array of JSON objects, each describing a section of constant BPM.
            - `val` - `int` - The BPM of the section.
            - `st` / `ed` - `float` - Start and end time (in seconds) for the section.
        - `stops` - Array of JSON objects, each describing a stop in the chart.
            - `st` / `dur` - `float` - Start time and duration (in seconds) of the stop.
            - `beats` - `float` - Number of beats the duration corresponds to, in terms of the `dominant_bpm`.


- `courses.json`

    Array of JSON objects corresponding to courses in DDR and LIFE4. A course JSON object has the following fields.

    - `name`
    - `level` - `int` - `-1` for variable level courses (e.g. DDR courses have levels depending on selected difficulty)
    - `songs` - Array of JSON objects, each describing a song
        - `name` - Name of song should match with the `name` attribute for a song's JSON object.
        - `difficulty` - `Basic` / `Beginner` / `Difficult` / `Expert` / `Challenge` - Can be missing or null


- ~~`data.json`~~ **OBSOLETE**

    JSON file containing all JSON data of songs. Basically an array of `data/*.json`.