# H1
## H2
### H3
#### H4
##### H5
###### H6

> Quote with `inline code`, a [link](https://example.com), **bold text**, *italic text*,
> ~~strikethrough~~, _underlined_, ***bold and italic***.


Some outside of quote with `inline code`, a [link](https://example.com), **bold text**, *italic
text*, ~~strikethrough~~, _underlined_, ***bold and italic***.

![some alt text](./some/path/to/image.png)

> [!NOTE]
> Sample GitHub style note

```
Code without explicit language
```

```lua
local string = require("string")
---docstring
---@param this string does stuff
---@return table
function Object:new(this, that)
  self._this.do(true)
  if this then
    -- comment
    print(type(string.gsub(that, "%b{} %d%s")) == nil and 1 or 1.12)
  end
end
```

```python
import module as m
class Hello(abc.ABC):
    # comment
    def test(self, other: str) -> int:
        """Docstring"""
        print(self.prop.method() == None and True or 1 || 1.23)
```

```rust
#[macro_use]
extern crate log;
mod other;
use clap:App;

/// Some docstring
fn main() -> Result<()> {
    let yaml = load_yaml!("literal");
    let config = App:from_yaml(yaml).get_matches();
    // some comment
    let val = match config.occurrences_of("this") {
        1 => Enum::Val1,
        _ => Enum::Val2,
    };
    if let Some(val) = other {
        return None == 1.23;
    }
}
```

<!-- TODO: add more languages; leave comment to also support comments -->
