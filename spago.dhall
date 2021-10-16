{ name = "hby-dom"
, dependencies =
  [ "console"
  , "effect"
  , "prelude"
  , "psci-support"
  , "either"
  , "smolder"
  , "foldable-traversable"
  , "hby-eeffect"
  ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs" ]
}
