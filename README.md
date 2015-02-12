# cookbook-pokenum

This lets you speak PHP to poker-eval. It's wrapped up in chef and Test Kitchen.

## Why

1) This is fun and entertaining -- it's the intersection/overlap between Chef and poker.

2) This is meant to improve upon https://github.com/j-c-h-e-n-g/vagrant-pokenum -- which is OS/distro specific and locks you into just one webserver. You might wonder, why would you really bother testing against different distros? Isn't this overkill? Hell ya it is, for this case. But not for other things. 

3) Why not? 

## Supported Platforms

* Ubuntu 12.04
* Ubuntu 14.04

... having issues with CentOS - `*.so` PHP extension can't load but `phpize` seems to finish. hmmm.



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
