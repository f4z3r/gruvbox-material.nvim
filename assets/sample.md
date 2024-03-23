# H1
## H2
### H3
#### H4
##### H5
###### H6

> Quote with `inline code`, a [link](https://example.com), **bold text**, *italic text*,
> ~~strikethrough~~, ***bold and italic***.


Some outside of quote with `inline code`, a [link](https://example.com), **bold text**, *italic
text*, ~~strikethrough~~, ***bold and italic***.

![some alt text](./some/path/to/image.png)

> [!NOTE]
> Sample GitHub style note

- some
- unnumbered
- list
- [ ] with checkbox
- [x] that is checked

1. Some numbered list
2. Some numbered list

```
Code without explicit language
```

```diff
+["@string.escape"] = { link = "Yellow" },
-["@string.escape"] = { link = "Green" },
```

```lua
local string = require("string")
local CONSTANT = "test"
---docstring
---@param this string does stuff
---@return table
function Object:new(this, that)
  self._this.do(true)
  if this then
    -- NOTE: comment
    b = a + c
    print(type(string.gsub(that, "%b{} \n%d%s")) == nil and 1 or 1.12)
    string.format("%s=%d", this, that)

  end
end
```

```python
import module as m
class Hello(abc.ABC):
    # FIX: comment
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
    let yaml = load_yaml!("/path/to/some/file.png");
    let config = App:from_yaml(yaml).get_matches();
    // BUG: comment
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
<!-- some link in the comments: https://github.com/nvim-treesitter -->
