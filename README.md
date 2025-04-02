# database.news

The list of RSS feeds for https://database.news/ is stored in a `feeds.json` to allow community contributions.

### Contributing

- Send a pull request adding whatever feeds you think are good.
- Your PR might be closed without explanation. Don't cry about it.


### feeds.json Configuration Options

The feeds.json file contains an array of feed objects. Each feed object supports the following properties:

```json
[
  {
    "title": "Feed Title",
    "url": "https://example.com/feed.xml",
    "category": "Database",
    "filter_tags": ["tag1", "tag2"],
    "ignore_tags": ["unwanted1", "unwanted2"]
  }
]
```

#### Required Properties

- **title** (string): The display name of the feed source
- **url** (string): The URL to the RSS/Atom feed (must be a valid RSS or Atom feed URL)

#### Optional Properties

- **category** (string): The category of the feed (e.g., "Database", "SQL", etc.)
- **filter_tags** (array of strings): Only articles containing at least one of these tags (or containing these terms in title/description) will be included
- **ignore_tags** (array of strings): Articles containing any of these tags (or containing these terms in title/description) will be excluded

### Tag Filtering Behavior

The tag filtering works in the following order:

1. If an article contains any tag in `ignore_tags`, it is skipped regardless of other tags
2. If `filter_tags` is specified (and not empty) and the article doesn't match any tag, it is skipped
3. If no `filter_tags` are specified, all articles from the feed are included (unless excluded by `ignore_tags`)
4. If both filters pass, the article is added to the database

Tags are checked in:
- The RSS feed's category/tag fields
- The article title
- The article description

Note: If you want to include all articles from a feed, simply omit the `filter_tags` property or set it to an empty array.

### Example Feed Configuration

```json
{
  "title": "PlanetScale Blog",
  "url": "https://planetscale.com/blog/feed.atom",
  "category": "Database",
  "filter_tags": ["mysql", "vitess", "database", "sql"],
  "ignore_tags": ["announcement", "release"]
}
```

This configuration will:
- Import articles from the PlanetScale blog
- Only include articles that mention MySQL, Vitess, database, or SQL
- Skip any articles that are tagged as announcements or releases

### Feed Removal Behavior

When a feed is removed from the feeds.json file:
- The feed will be removed from the database the next time the feed fetcher runs
- All articles from that feed will be permanently deleted
- This cleanup happens automatically with each feed fetcher run

To add a new feed or modify existing feeds, submit a PR to the feeds repository.
