{ name = "hby-dom"
, dependencies =
  [ "console"
  , "effect"
  , "either"
  , "exceptions"
  , "prelude"
  , "psci-support"
  , "smolder"
  ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs" ]
}
