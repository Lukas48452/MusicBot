<picture>
  <source media="(prefers-color-scheme: dark)" srcset="https://i.imgur.com/zrE80HY.png">
  <img align="right" src="https://i.imgur.com/zrE80HY.png" height="200" width="200">
</picture>

# JMusicBot

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://github.com/jagrosh/MusicBot/blob/master/LICENSE)
[![Java](https://img.shields.io/badge/Java-26-%23ED8B00?logo=openjdk)](https://adoptium.net/temurin/releases/)
[![Gradle](https://img.shields.io/badge/Gradle-9.5-%2302303A?logo=gradle)](https://gradle.org)
[![Build](https://img.shields.io/github/actions/workflow/status/jagrosh/MusicBot/build-and-test.yml?logo=github)](https://github.com/jagrosh/MusicBot/actions/workflows/build-and-test.yml)
[![Docker](https://img.shields.io/badge/Docker-Compose-%232496ED?logo=docker)](https://docs.docker.com/compose/)

A cross-platform Discord music bot with a clean interface, easy to set up and run yourself.

---

## Features

- **Slash commands** — `/play`, `/skip`, `/stop`, `/pause`, `/volume`, `/queue`, `/nowplaying`, `/shuffle`, `/search`, `/lyrics`, `/remove`, `/repeat`, `/forceskip`, `/playnext`
- **Interaction modes** — choose between slash commands, text commands, or both
- Spotify support (tracks, playlists, albums via Spotify Web API)
- YouTube, SoundCloud, Bandcamp, Vimeo, Twitch, and more
- Local file and playlist support
- Clean embed-based menus
- DJ role with per-server permissions
- **Docker Compose** for one-command deployment
- **Makefile** convenience commands

## Setup

### Docker Compose (Recommended)

```sh
git clone https://github.com/jagrosh/MusicBot.git
cd MusicBot
make run
```

The bot restarts automatically unless stopped with `make stop` or `docker compose down`.

| Command | Description |
|---------|-------------|
| `make build` | rebuild the Docker image |
| `make run` | start the bot in the background |
| `make stop` | stop the bot |
| `make logs` | tail bot logs |
| `make restart` | rebuild and restart |
| `make test` | run tests via Gradle |

### Manual (Gradle)

```sh
./gradlew shadowJar
java -jar build/libs/JMusicBot-All.jar --nogui
```

Requirements: JDK 26+, Gradle 9.5+ (or use the bundled wrapper).

### Generate a default config

```sh
java -jar build/libs/JMusicBot-All.jar --generate-config
```

## Configuration

Create `config.yaml` in the project root or `config/` directory:

```yaml
token = "your-bot-token"
owner = 123456789012345678
prefix = "!"
interactionmode = "all"
```

| Setting | Default | Description |
|---------|---------|-------------|
| `token` | `BOT_TOKEN_HERE` | Discord bot token (required) |
| `owner` | `0` | Owner user ID (required) |
| `prefix` | `@mention` | Text command prefix |
| `interactionmode` | `all` | `all`, `text`, or `slash` |
| `spotify.clientid` | `""` | Spotify API client ID |
| `spotify.clientsecret` | `""` | Spotify API client secret |

### Interaction Modes

| Mode | Text Commands | Slash Commands |
|------|:---:|:---:|
| `all` (default) | ✓ | ✓ |
| `text` | ✓ | ✗ |
| `slash` | ✗ | ✓ |

## Spotify Setup

1. Go to the [Spotify Developer Dashboard](https://developer.spotify.com/dashboard) and create an app
2. Set the redirect URI to `https://example.com/callback` (not used by the bot)
3. Copy the **Client ID** and **Client Secret**
4. Add them to `config.yaml`:
   ```yaml
   spotify {
       clientid = "your-client-id"
       clientsecret = "your-client-secret"
   }
   ```
5. Paste Spotify URLs into Discord — tracks, playlists, and albums all work

## Docker Images

Published to GHCR on every release:

```sh
docker pull ghcr.io/jagrosh/musicbot:latest
```

See [PUBLISH_GHCR.md](PUBLISH_GHCR.md) for setup instructions.

## Building from source

```sh
./gradlew build          # compile and run tests
./gradlew shadowJar      # build standalone fat JAR
./gradlew test           # run tests only
```

## Contributing

- Report bugs or suggest features via [Issues](https://github.com/jagrosh/MusicBot/issues)
- Ask questions or get help in [Discussions](https://github.com/jagrosh/MusicBot/discussions)
- Read the code of conduct before submitting a PR

## License

Apache 2.0 — see [LICENSE](LICENSE).

Thanks to [JDA](https://github.com/DV8FromTheWorld/JDA), [lavaplayer](https://github.com/sedmelluq/lavaplayer), and all other open-source libraries that make this project possible.
