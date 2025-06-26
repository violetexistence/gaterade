// TODO: Update these when the code is written =)

![image info](./lucy_gaterade2.png)

# gaterade

*The refreshing decoder for Discord's Gateway API, lovingly crafted in Gleam.*

`gaterade` provides type-safe message structures and decoders/encoders for Discord's [Gateway API](https://discord.com/developers/docs/events/gateway).
It's designed for building bots, services, and Discord-powered tools in Gleam, without the headache of manual JSON wrangling.

## What is it?

At its core, 'gaterade' turns this...

```json
{
    "op": 10,
    "d": {
        "hearbeat_interval": 41250
    }
}
```

...into **beautifully typed Gleam records** like this:

```gleam
type Hello {
    Hello(
        hearbeat_interval: Int
    )
}
```

## Features
- ✅ Typed Gateway message envelopes
- ✅ Encoders & decoders for all standard OpCodes
- ✅ Easy to extend with custom Discord payloads
- ✅ Friendly and composable, designed for ergonomic Gleaming
- ❄️ Zero dependencies outside the Gleam stdlib

## Getting Started

[![Package Version](https://img.shields.io/hexpm/v/gaterade)](https://hex.pm/packages/gaterade)
[![Hex Docs](https://img.shields.io/badge/hex-docs-ffaff3)](https://hexdocs.pm/gaterade/)

```sh
gleam add gaterade
```

```gleam
import gaterade
import gleam/json
import gleam/result

pub fn main() -> Nil {
  let msg = "{\"op\": 10, \"d\": { \"heartbeat_interval\": 45000}}"
  |> json.decode()
  |> result.then(gaterade.decode(_))
  
  case msg {
    Ok(Hello(heartbeat)) -> echo "Hello, heartbeat interval is " <> { hearbeat |> int.to_string() }
    _ -> echo "No one expects the " <> msg.message_type
  }
}
```

Further documentation can be found at <https://hexdocs.pm/gaterade>.

## Development

```sh
gleam run   # Run the project
gleam test  # Run the tests
```
