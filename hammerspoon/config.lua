hyper = {"ctrl", "alt", "cmd"}

-- auto reload config
configFileWatcher = hs.pathwatcher.new(hs.configdir, hs.reload):start()
