import gleam/option
import snowflake.{type Snowflake}

pub type Hello {
  Hello(heartbeat_interval: Int)
}

pub type Identify {
  Identify(
    token: String,
    intents: Int,
    properties: ConnectionProperties,
    compress: option.Option(Bool),
    large_threshold: option.Option(Int),
    shard: option.Option(ShardInformation),
    presence: option.Option(UpdatePresence),
  )
}

pub type Ready {
  Ready(
    api_version: Int,
    user: User,
    guilds: List(UnavailableGuild),
    session_id: String,
    resume_gateway_url: String,
    shard: option.Option(ShardInformation),
    application_id: Snowflake,
    application_flags: option.Option(Int),
  )
}

pub type Resumed

pub type Reconnect

pub type InvalidSession {
  InvalidSession(may_be_resumed: Bool)
}

pub type User {
  User(
    id: Snowflake,
    username: String,
    discriminator: String,
    global_name: option.Option(String),
    avatar: option.Option(String),
    is_bot: option.Option(Bool),
    is_system: option.Option(Bool),
    mfa_enabled: option.Option(Bool),
    banner: option.Option(String),
    accent_color: option.Option(Int),
    locale: option.Option(String),
    is_verified: option.Option(Bool),
    email: option.Option(String),
    flags: option.Option(Int),
    premium_type: option.Option(Int),
    public_flags: option.Option(Int),
    avatar_decoration_data: option.Option(AvatarDecorationData),
    collectibles: option.Option(Collectible),
  )
}

pub type UnavailableGuild {
  UnavailableGuild(id: Snowflake)
}

pub type ShardInformation

pub type AvatarDecorationData {
  AvatarDecorationData(sku_id: Snowflake)
}

pub type Collectible {
  Collectible(nameplace: option.Option(Nameplate))
}

pub type Nameplate {
  Nameplate(sku_id: Snowflake, asset: String, label: String, palette: String)
}

pub type ConnectionProperties {
  ConnectionProperties(os: String, browser: String, device: String)
}

pub type UpdatePresence {
  UpdatePresence(
    status: PresenceStatus,
    since: option.Option(Int),
    afk: Bool,
    activities: List(Activity),
  )
}

pub type PresenceStatus {
  Online
  Dnd
  Idle
  Invisible
  Offline
}

pub type Activity {
  Activity(
    name: String,
    activity_type: ActivityType,
    url: option.Option(String),
    created_at: Int,
    timestamps: option.Option(ActivityTimestamp),
    // todo: is this actually a list or dict?
    application_id: option.Option(Snowflake),
    details: option.Option(String),
    state: option.Option(String),
    emoji: option.Option(ActivityEmoji),
    party: option.Option(ActivityParty),
    assets: option.Option(ActivityAssets),
    secrets: option.Option(ActivitySecrets),
    is_instance: option.Option(Bool),
    flags: option.Option(Int),
    buttons: option.Option(List(ActivityButton)),
  )
}

pub type ActivityType {
  Playing
  Streaming
  Listening
  Watching
  Custom
  Competing
}

pub type ActivityTimestamp {
  ActivityTimestamp(start: option.Option(Int), end: option.Option(Int))
}

pub type ActivityEmoji {
  ActivityEmoji(
    name: String,
    id: option.Option(Snowflake),
    is_animated: option.Option(Bool),
  )
}

pub type ActivityParty {
  ActivityParty(id: option.Option(String), size: option.Option(PartySize))
}

pub type PartySize {
  PartySize(current_size: Int, max_size: Int)
}

pub type ActivityAssets {
  ActivityAssets(
    large_image: option.Option(String),
    large_text: option.Option(String),
    small_image: option.Option(String),
    small_text: option.Option(String),
  )
}

pub type ActivitySecrets {
  ActivitySecrets(
    join: option.Option(String),
    spectate: option.Option(String),
    match: option.Option(String),
  )
}

pub type ActivityButton {
  ActivityButton(label: String, url: String)
}
