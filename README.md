# pokenum-cookbook

In the grand scheme of things, this doesn't really do much does it? Well at least it produces a working locally running pokenum. Sure you could rewrite it or do this some other way, but that would be less fun.

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
