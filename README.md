# pokenum-cookbook

In the grand scheme of things, this doesn't really do much does it? Well at least it produces a working locally running pokenum. Sure you could rewrite it or do this some other way, but that would be less fun. 

## Why

1) This is fun and entertaining -- it's the intersection/overlap between Chef and poker.

2) This is meant to improve upon https://github.com/j-c-h-e-n-g/vagrant-pokenum -- which is OS/distro specific and locks you into just one webserver. You might wonder, why would you really bother testing against different distros? Isn't this overkill? Hell ya it is, for this case. But not for other things. 

3) Why not? 

## Supported Platforms

TODO: List your supported platforms.

## Attributes

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['pokenum']['bacon']</tt></td>
    <td>Boolean</td>
    <td>whether to include bacon</td>
    <td><tt>true</tt></td>
  </tr>
</table>

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

Author:: YOUR_NAME (<YOUR_EMAIL>)
