<div align="center">
  <img src="https://i.imgur.com/c3EnyxI.png" alt="LeRequin92 PP" width="200"/>
  <h1>LeRequin92</h1>
  <h3>Discord bot that plays sounds</h3>
  <a href="https://discordapp.com/api/oauth2/authorize?client_id=608681843570507833&permissions=3145984&scope=bot">Invitation link</a>
</div>

- [🔊 Usage](#-usage)
- [💻 Developing](#-developing)
- [📜 Credits](#-credits)
- [🔐 License](#-license)

## 🔊 Usage

Connect the bot to your voice channel by using the `92:connect` command.

Then, list the available sounds using the `92:list` command.

When you have chosen your sound, use `92:<sound name>` to play it.

## 💻 Developing

First of all, install the required dependencies :

- Ruby 2.6
- Discordrb Ruby gem
- Opus library
- Libsodium
- FFMPEG

When you installed them, clone the repository on your local drive :

```bash
git clone https://github.com/exybore/lerequin92.git  # HTTP
git clone git@github.com:exybore/lerequin92          # SSH
```

Rename the `config.sample.json` file into `config.json` and edit the parameters. Then, place your sounds under the `sounds` directory, or any directory you defined in the configuration file.

Finally, launch the bot using Ruby :

```bash
ruby main.rb
```

## 📜 Credits

- Library : Discordrb
- Maintainer : [Exybore](https://exybore.becauseofprog.fr)

## 🔐 License

[GNU GPL v3](LICENSE)
