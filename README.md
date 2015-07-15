# cookbook-pokenum

This lets you speak PHP to poker-eval. It's wrapped up in chef and Test Kitchen.

## Supported Platforms

Chef converges sucessfully for these:

* Ubuntu 12.04
* Ubuntu 14.04

but not for CentOS - `*.so` PHP extension can't load but `phpize` seems to finish. hmmm.



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

Author:: John Cheng (<github@johncheng.com>)
