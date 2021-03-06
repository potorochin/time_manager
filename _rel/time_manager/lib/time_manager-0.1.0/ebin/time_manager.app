{application, time_manager,
 [{description, "An OTP application"},
  {vsn, "0.1.0"},
  {registered, []},
  {mod, { time_manager_app, []}},
  {applications,
   [kernel,
    stdlib,
    cowboy,
    jsx,
    epgsql,
    eredis,
    erlsom
   ]},
  {env,[]},
  {modules, ['handler', 'time_manager_app', 'time_manager', 'time_manager_sup']},

  {maintainers, []},
  {licenses, ["Apache 2.0"]},
  {links, []}
 ]}.
