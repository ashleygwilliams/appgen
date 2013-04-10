AppGen
=====

## How to
To start webapp
```
$ bundle install
$ bundle exec shotgun
```

Then visit...
http://localhost:9393/

## Important details

### App name
As we develop AppGen, existing apps will randomly change. That is fine; it
reflects the improvements on the apps. However, the name of the app should
should not change very much. This is because each app will be associated with
a particular domain name that we're going to tell people about.

In order to keep the name consistent, we are setting the random seed inside of
`FakeApp.getRandomName`. **Don't change this**. In fact, you should probably.
avoid changing anything about this method.
