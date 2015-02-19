# cookbook-pokenum

This lets you speak PHP to poker-eval. It's wrapped up in chef and Test Kitchen.

## Supported Platforms

We get successful chef runs via Test Kitchen for the following:

* Ubuntu 12.04
* Ubuntu 14.04

... but having issues with CentOS - `*.so` PHP extension can't load but `phpize` seems to finish. hmmm.



## Usage

### pokenum::default

Include `pokenum` in your node's `run_list`:

```json
{
  "run_list": [
    "recipe[pokenum::default]"
  ]
}
```

## License and Authors

Author:: John Cheng (<devnull@johncheng.com>)
