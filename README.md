![image info](./lucy_gaterade.jpg)

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
        "hearbeat_interval": 41250,
        "_trace": ["gateway-prd-main-XXX"]
    },
    "s": null,
    "t": null
}
```

...into **beautifully types Gleam records** like this:

```gleam
import gaterade.{GatewayMessage, OpCode, Hello}

let msg: GatewayMessage = Hello(
    hearbeat_interval: 41250,
    trace: ["gateway-prd-main-XXX"]
)
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
gleam add gaterade@1
```

```gleam
import gaterade
import gleam/json
import gleam/result

pub fn main() -> Nil {
  let json_string = "{\"op\": 10, \"d\": { \"heartbeat_interval\": 45000}}"
  let message = json.decode(json_string)
  |> result.then(gaterade.decode_gateway_message)
  case message {
    discord.Hello(msg) -> echo "Hello, heartbeat interval is " <> { msg.hearbeat_interval |> int.to_string() }
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
