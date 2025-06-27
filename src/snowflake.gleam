import gleam/int

const discord_epoch = 1_420_070_400_000

pub type Snowflake =
  Int

pub fn to_timestamp(id: Snowflake) -> Int {
  int.bitwise_shift_right(id, 22) + discord_epoch
}

pub fn to_worker_id(id: Snowflake) -> Int {
  int.bitwise_and(id, 0x3E0000) |> int.bitwise_shift_right(17)
}

pub fn to_process_id(id: Snowflake) -> Int {
  int.bitwise_and(id, 0x1F000) |> int.bitwise_shift_right(12)
}

pub fn to_increment(id: Snowflake) -> Int {
  int.bitwise_and(id, 0xFFF)
}

pub fn from_timestamp_ms(timestamp_ms: Int) -> Snowflake {
  { timestamp_ms - discord_epoch } |> int.bitwise_shift_left(22)
}
