# Pocket Stuffer

This is a simple app that allows people to set up blogs and Twitter accounts to
automatically synchronize to [Pocket](http://getpocket.com).

It's hosted at <http://pocketstuffer.herokuapp.com>.

## Running it locally

You'll need an instance of postgres that a Rails app can connect to with no
particular ceremony.

You'll also need a [Pocket API key](http://getpocket.com/developer/apps/new)
and a [Twitter API key](http://apps.twitter.com/). Put the credentials in
the environment variables `POCKET_CONSUMER_KEY`, `TWITTER_API_KEY`, and
`TWITTER_API_SECRET` respectively. You can also create a file
`config/defaults/development.yml` containing the credentials, like so:

```yaml
POCKET_CONSUMER_KEY: "pocketkeyhere"
TWITTER_API_KEY: "twitterkeyhere"
TWITTER_API_SECRET: "twittersecrethere"
```

## Contributing

Contributions are welcome! This is a weekend project and there's plenty more
that can be done with it. Just fork it and make a pull request.

## License

See attached LICENSE file
