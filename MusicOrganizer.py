import os
from essentia.standard import *

def get_track_info(file):
    try:
        # Load the audio file
        loader = MonoLoader(filename=file)
        audio = loader()

        # Extract the tonal information
        tonal_extractor = TonalExtractor()
        key, scale, strength, _, _ = tonal_extractor(audio)

        # Extract the BPM
        bpm_extractor = TempoTapTicks(method='default')
        ticks = bpm_extractor(audio)
        bpm = int(round(60.0 / (mean(ticks) / loader.sampleRate())))
        return key, scale, bpm
    except Exception as e:
        # Handle the case when the file cannot be processed
        print(f'Error in getting metadata for {file} with error {e}')
        return None, None, None

# Iterate through all files in the music directory
download_folder = 'downloaded_music_directory'
for root, dirs, files in os.walk(download_folder):
    for file in files:
        if file.endswith('.mp3') or file.endswith('.wav'):
            file_path = os.path.join(root, file)
            key, scale, bpm = get_track_info(file_path)
            if key and scale and bpm:
                # Create the folders for each key and bpm
                os.makedirs(f"{download_folder}/{key}/{scale}/{bpm}", exist_ok=True)
                # Move the file to the corresponding folder
                os.replace(file_path, f"{download_folder}/{key}/{scale}/{bpm}/{file}")
                print(f'{file}: Key: {key}, Scale: {scale}, BPM: {bpm}')
            else:
                print(f'{file} Could not get any information')
