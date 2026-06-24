<img align="right" src="https://i.imgur.com/zrE80HY.png" height="200" width="200">

# JMusicBot

[![License](https://img.shields.io/github/license/jagrosh/MusicBot.svg)](https://github.com/jagrosh/MusicBot/blob/master/LICENSE)
[![Build and Test](https://github.com/jagrosh/MusicBot/actions/workflows/build-and-test.yml/badge.svg)](https://github.com/jagrosh/MusicBot/actions/workflows/build-and-test.yml)

A cross-platform Discord music bot with a clean interface, easy to set up and run yourself!

## Features
  * Fast loading of songs
  * No external keys needed (besides a Discord Bot token)
  * Smooth playback
  * Server-specific setup for the "DJ" role that can moderate the music
  * Clean and beautiful menus
  * Supports many sites, including Youtube, Soundcloud, Spotify, and more
  * Supports many online radio/streams
  * Supports local files
  * Playlist support (both web/youtube, and local)
  * Docker Compose support for easy deployment
  * Makefile with convenience commands (`make build`, `make run`, etc.)

## Supported sources and formats
JMusicBot supports all sources and formats supported by [lavaplayer](https://github.com/sedmelluq/lavaplayer#supported-formats):
### Sources
  * YouTube
  * SoundCloud
  * Bandcamp
  * Vimeo
  * Twitch streams
  * Spotify (tracks, playlists, and albums via Spotify Web API)
  * Local files
  * HTTP URLs
### Formats
  * MP3
  * FLAC
  * WAV
  * Matroska/WebM (AAC, Opus or Vorbis codecs)
  * MP4/M4A (AAC codec)
  * OGG streams (Opus, Vorbis and FLAC codecs)
  * AAC streams
  * Stream playlists (M3U and PLS)

## Example
![Loading Example...](https://i.imgur.com/kVtTKvS.gif)

## Setup

### Docker Compose (Recommended)
The easiest way to run the bot is with Docker Compose:

```sh
make run        # or: docker compose up -d
```

The bot will restart automatically unless stopped with `make stop` (or `docker compose down`).

Other convenience commands:
```sh
make build      # rebuild the Docker image
make logs       # tail the bot logs
make restart    # rebuild and restart
make test       # run tests via Gradle
```

### Manual (Gradle)
1. Clone this repository
2. Build the fat JAR:
   ```sh
   ./gradlew shadowJar
   ```
3. Create a `config.yaml` from the [configuration reference](https://jmusicbot.com/config)
4. Run the bot:
   ```sh
   java -jar build/libs/JMusicBot-All.jar --nogui
   ```

> **Requirements**: JDK 26+, Gradle 9.5+ (or use the provided Gradle wrapper)

## Spotify Setup (Optional)
The bot can play Spotify tracks, playlists, and albums by resolving them via the Spotify Web API and loading the audio from YouTube.

1. Go to the [Spotify Developer Dashboard](https://developer.spotify.com/dashboard) and create an app
2. Copy the **Client ID** and **Client Secret**
3. Add them to your `config.yaml`:
   ```
   spotify {
       clientid = "your-client-id"
       clientsecret = "your-client-secret"
   }
   ```
4. Paste any Spotify track, playlist, or album URL into Discord and the bot will play it

## Questions/Suggestions/Bug Reports
**Please read the [Issues List](https://github.com/jagrosh/MusicBot/issues) before suggesting a feature**. If you have a question, need troubleshooting help, or want to brainstorm a new feature, please start a [Discussion](https://github.com/jagrosh/MusicBot/discussions). If you'd like to suggest a feature or report a reproducible bug, please open an [Issue](https://github.com/jagrosh/MusicBot/issues) on this repository. If you like this bot, be sure to add a star to the libraries that make this possible: [**JDA**](https://github.com/DV8FromTheWorld/JDA) and [**lavaplayer**](https://github.com/sedmelluq/lavaplayer)!

## Building from source
This project uses **Gradle** with the Kotlin DSL and targets **JDK 26**.

```sh
./gradlew build        # compile and run tests
./gradlew shadowJar    # build a standalone fat JAR
./gradlew test         # run tests only
```

## Editing
This bot (and the source code here) might not be easy to edit for inexperienced programmers. The main purpose of having the source public is to show the capabilities of the libraries, to allow others to understand how the bot works, and to allow those knowledgeable about java, JDA, and Discord bot development to contribute. There are many requirements and dependencies required to edit and compile it, and there will not be support provided for people looking to make changes on their own. Instead, consider making a feature request (see the above section). If you choose to make edits, please do so in accordance with the Apache 2.0 License.
