import gleeunit/should
import snowflake

///
/// [Snowflakes](https://discord.com/developers/docs/reference#snowflakes)
///
const example_snowflake: snowflake.Snowflake = 175_928_847_299_117_063

pub fn to_timestamp_test() {
  example_snowflake
  |> snowflake.to_timestamp()
  |> should.equal(1_462_015_105_796)
}

pub fn to_worker_id_test() {
  example_snowflake |> snowflake.to_worker_id() |> should.equal(1)
}

pub fn to_process_id_test() {
  example_snowflake |> snowflake.to_process_id() |> should.equal(0)
}

pub fn to_increment_test() {
  example_snowflake |> snowflake.to_increment() |> should.equal(7)
}

pub fn from_timestamp_ms_test() {
  let timestamp_ms = 1_462_015_105_796

  timestamp_ms
  |> snowflake.from_timestamp_ms()
  |> snowflake.to_timestamp()
  |> should.equal(timestamp_ms)
}
