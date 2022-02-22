{ name = "hby-dom"
, dependencies =
  [ "console"
  , "effect"
  , "hby-task"
  , "prelude"
  ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs" ]
}
